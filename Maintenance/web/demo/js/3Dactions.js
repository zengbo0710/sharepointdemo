//=================================================

var Runtime;
var Scene;
var Creator;
var LocalEv3de;

//=================================================

function DebugOut(dbg_lvl, dbg_msg)
{
	if (dbg_lvl == -1)
		alert(dbg_msg);
}

//=================================================

function InitContext()
{
	LocalEv3de = document.getElementById("ev3de");
	var res = false;
	if (typeof(Runtime) == "undefined")
		Runtime = LocalEv3de.Runtime;
	if (typeof(Scene) == "undefined")
		Scene = LocalEv3de.Scene;
	if (typeof(Creator) == "undefined")
		Creator = LocalEv3de.Creator;
	res = (typeof(Runtime) != "undefined") && (typeof(Scene) != "undefined");
	if (res)
		res = (Runtime != null) && (Scene != null);
	if (!res)
		alert("context is not initiated!");
	return res;
}

//=================================================

function SetView(view_port_type)
{
	if (!InitContext() )
		return;
	var dst_type = "";
	switch (view_port_type)
	{
	case "Left" :	dst_type = "M1114"; break;
	case "Right" :	dst_type = "M1115"; break;
	case "Top" :	dst_type = "M1112"; break;
	case "Bottom" :	dst_type = "M1113"; break;
	case "Front" :	dst_type = "M1117"; break;
	case "Back" :	dst_type = "M1116"; break;
	case "Iso" :	dst_type = "M1118"; break;
	default:
		dst_type = "M1117"; // "Front";
	}
	LocalEv3de.ExecuteCommand(dst_type);
}

//=================================================

function AddOptionIntoSelect(select_ctrl, nm, vl)
{
	var option = document.createElement("option");
	option.text = nm;
	option.value = vl;
	(select_ctrl.options.add) ? select_ctrl.options.add(option) : select_ctrl.add(option, null);
}

//=================================================

function SetDescriptionText(elem, str)
{
	if (elem == null)
		return;
	if (typeof(elem) == "undefined")
		return;
	if (typeof(str) != "undefined")
		elem.innerHTML = str;
	else
		elem.innerHTML = "";
	elem.scrollTop = 0;
}

//=================================================

function ExtractMetadata(node, category, meta_name)
{
	meta_cat = null;
	meta_var = node.Metadata;
	for (idx = 0; idx < meta_var.Count; idx ++)
	{
		meta_key = meta_var.KeyAt(idx);
		if (meta_key == category)
			meta_cat = meta_var.ValueAt(idx);
	}
	if (meta_cat == null)
		return "";
	for (idx = 0; idx < meta_cat.Count; idx ++)
	{
		meta_key = meta_cat.KeyAt(idx);
		if ( (meta_key.indexOf(meta_name) > 0) && (meta_key.indexOf("_RTF") < 1) )
		{
			meta_val = meta_cat.ValueAt(idx);
			meta_str = meta_val.Value;
			return meta_str;
		}
	}
	return "";
}

//=== mouse click handling ========================

var MouseHandler;
var CtrlNodeName;
var CtrlTitle;
var CtrlNotes;
var CtrlTolers;

function InitClickHandler(name_ctrl, title_ctrl, notes_ctrl, tolers_ctrl)
{
	if (!InitContext() )
		return;

	CtrlNodeName = name_ctrl;
	CtrlTitle = title_ctrl;
	CtrlNotes = notes_ctrl;
	CtrlTolers = tolers_ctrl;

	MouseHandler = Creator.MouseEventHandler.Create();
	MouseHandler.onMouseDown = true;
	MouseHandler.onEvent = function(event)
	{
		if (event.isMouseDown)
		{
			node = event.hits.target;
			if (node)
			{
				SetDescriptionText(CtrlNodeName, node.name);
				SetDescriptionText(CtrlTitle, ExtractMetadata(node, "PMIMetadata", "TITLE_BLOCK") );
				SetDescriptionText(CtrlNotes, ExtractMetadata(node, "PMIMetadata", "NOTES") );
				SetDescriptionText(CtrlTolers, ExtractMetadata(node, "PMIMetadata", "TOLERANCE") );
			}
			else
			{
				SetDescriptionText(CtrlNodeName, "");
				SetDescriptionText(CtrlTitle, "");
				SetDescriptionText(CtrlNotes, "");
				SetDescriptionText(CtrlTolers, "");
			}
		}
		return true;
	}
	Runtime.addEventHandler(MouseHandler);
}

//=================================================

function FillRenderModes(rm_ctrl)
{
	if (!InitContext() )
		return;
	AddOptionIntoSelect(rm_ctrl, "Bounding Box", Scene.RENDER_MODE_BOUNDING_BOX);
	AddOptionIntoSelect(rm_ctrl, "Transparent BBox", Scene.RENDER_MODE_TRANSPARENT_BOUNDING_BOX);
	AddOptionIntoSelect(rm_ctrl, "Transparent BBox Outline", Scene.RENDER_MODE_TRANSPARENT_BOUNDING_BOX_OUTLINE);
	AddOptionIntoSelect(rm_ctrl, "Vertices", Scene.RENDER_MODE_VERTICES);
	AddOptionIntoSelect(rm_ctrl, "Shaded Vertices", Scene.RENDER_MODE_SHADED_VERTICES);
	AddOptionIntoSelect(rm_ctrl, "Wireframe", Scene.RENDER_MODE_WIREFRAME);
	AddOptionIntoSelect(rm_ctrl, "Shaded Wireframe", Scene.RENDER_MODE_SHADED_WIREFRAME);
	AddOptionIntoSelect(rm_ctrl, "Solid", Scene.RENDER_MODE_SOLID);
	AddOptionIntoSelect(rm_ctrl, "Transparent", Scene.RENDER_MODE_TRANSPARENT);
	AddOptionIntoSelect(rm_ctrl, "Shaded Solid Wireframe", Scene.RENDER_MODE_SHADED_SOLID_WIREFRAME);
	AddOptionIntoSelect(rm_ctrl, "Transparent Wireframe", Scene.RENDER_MODE_TRANSPARENT_WIREFRAME);
	AddOptionIntoSelect(rm_ctrl, "Illistration", Scene.RENDER_MODE_ILLUSTRATION);
	AddOptionIntoSelect(rm_ctrl, "Solid Outline", Scene.RENDER_MODE_SOLID_OUTLINE);
	AddOptionIntoSelect(rm_ctrl, "Shaded Illustration", Scene.RENDER_MODE_SHADED_ILLUSTRATION);
	AddOptionIntoSelect(rm_ctrl, "Hidden Wireframe", Scene.RENDER_MODE_HIDDEN_WIREFRAME);
	rm_ctrl.value = Scene.RENDER_MODE_SOLID;
	ChangeRenderMode(rm_ctrl.value);
}

function ChangeRenderMode(val)
{
	if (InitContext() )
	{
		Scene.RenderMode = val;
		var vport = Scene.GetActiveViewPort();
		vport.RenderMode = Scene.RENDER_MODE_DEFAULT;
	}
}

function ChangeRenderMode2(r_mode)
{
	if (!InitContext() )
		return;
	var vport = Scene.GetActiveViewPort();
	vport.RenderMode = Scene.RENDER_MODE_DEFAULT;
	var new_r_mode = Scene.RENDER_MODE_DEFAULT;
	switch (r_mode)
	{
	case "illustration" :
		new_r_mode = Scene.RENDER_MODE_ILLUSTRATION;
		break;
	case "shaded illustration" :
		new_r_mode = Scene.RENDER_MODE_SHADED_ILLUSTRATION;
		break;
	case "solid" :
	default:
		new_r_mode = Scene.RENDER_MODE_SOLID;
	}
	Scene.RenderMode = new_r_mode;
}

//=================================================

function FillLightModes(lm_ctrl)
{
	if (!InitContext() )
		return;
	AddOptionIntoSelect(lm_ctrl, "From File", Scene.LIGHT_MODE_FILE);
	AddOptionIntoSelect(lm_ctrl, "None", Scene.LIGHT_MODE_NONE);
	AddOptionIntoSelect(lm_ctrl, "White", Scene.LIGHT_MODE_WHITE);
	AddOptionIntoSelect(lm_ctrl, "Day", Scene.LIGHT_MODE_DAY);
	AddOptionIntoSelect(lm_ctrl, "Bright", Scene.LIGHT_MODE_BRIGHT);
	AddOptionIntoSelect(lm_ctrl, "RBG", Scene.LIGHT_MODE_RGB);
	AddOptionIntoSelect(lm_ctrl, "Night", Scene.LIGHT_MODE_NIGHT);
	AddOptionIntoSelect(lm_ctrl, "Blue", Scene.LIGHT_MODE_BLUE);
	AddOptionIntoSelect(lm_ctrl, "Red", Scene.LIGHT_MODE_RED);
	AddOptionIntoSelect(lm_ctrl, "Cube", Scene.LIGHT_MODE_CUBE);
	AddOptionIntoSelect(lm_ctrl, "CAD Optimized", Scene.LIGHT_MODE_CAD);
	AddOptionIntoSelect(lm_ctrl, "Head Lamp", Scene.LIGHT_MODE_HEADLAMP);
	lm_ctrl.value = Scene.LIGHT_MODE_DAY;
	ChangeLightMode(lm_ctrl.value);
}

function ChangeLightMode(val)
{
	if (InitContext() )
		Scene.LightMode = val;
}

//=================================================

function FillGridModes(gm_ctrl)
{
	if (!InitContext() )
		return;
	AddOptionIntoSelect(gm_ctrl, "Off", Scene.GRID_MODE_OFF);
	AddOptionIntoSelect(gm_ctrl, "Solid", Scene.GRID_MODE_SOLID);
	AddOptionIntoSelect(gm_ctrl, "Transparent", Scene.GRID_MODE_TRANSPARENT);
	AddOptionIntoSelect(gm_ctrl, "Wire", Scene.GRID_MODE_WIRE);
	gm_ctrl.value = Scene.GRID_MODE_WIRE;
	ChangeGridMode(gm_ctrl.value);
}

function ChangeGridMode(val)
{
	if (InitContext() )
	{
		Scene.GridMode = val;
		var vport = Scene.GetActiveViewPort();
		vport.GridMode = -1;
		Scene.Update();
	}
}

//=== animation handling ==========================

var AnimationTimer;
var AnimationObject;
var AnimationIndex = 0;

//=================================================

function AnimObject(anim)
{
	this.animation = anim;
	this.frame_duration = 1 / anim.framesPerSecond;
	this.time_start = anim.startTime;
	this.time_end = anim.endTime;
	this.current_frame = 0;
	this.speed_factor = Scene.playSpeed;
	this.mode_pingpong = false;
	this.mode_repeat = false;
	this.playing = false;
	this.paused = false;

	this.RefreshParams = function()
	{
		this.frame_duration = 1 / this.animation.framesPerSecond;
		this.time_start = this.animation.startTime;
		this.time_end = this.animation.endTime;
		this.speed_factor = Scene.playSpeed;
	}
}

function InitAnimation(anim_index)
{
	if ( (typeof(AnimationObject) == "undefined") || (AnimationIndex != anim_index) )
	{
		var anim = null;
		if ( (0 <= anim_index) && (anim_index < Scene.Animations.Count) )
			anim = Scene.Animations.getByIndex(anim_index);
		if (anim)
		{
			Scene.ActivateAnimation(anim);
			for (back_idx = anim_index -1; back_idx > -1; back_idx --)
			{
				b_anim = Scene.Animations.GetByIndex(back_idx);
				b_anim.currentTime = b_anim.startTime;
			}
			AnimationObject = new AnimObject(anim);
			AnimationIndex = anim_index;
		}
	}
	if (typeof(AnimationTimer) == "undefined")
	{
		AnimationTimer = Creator.TimeEventHandler.Create();
		AnimationTimer.onEvent = function(event)
		{
			if (!AnimationObject)
				return;
			if (AnimationObject.playing && !AnimationObject.paused)
			{
				AnimationObject.animation.currentTime += AnimationObject.frame_duration * AnimationObject.speed_factor;
    				if (AnimationObject.animation.currentTime >= AnimationObject.time_end)
				{
					if (AnimationObject.mode_repeat)
					{
						if (AnimationObject.mode_pingpong)
							AnimationObject.speed_factor *= -1;
						else
							AnimationObject.animation.currentTime = AnimationObject.time_start;
					}
					else
						AnimationObject.playing = false;
				}
				if (AnimationObject.animation.currentTime <= AnimationObject.time_start)
				{
					if (AnimationObject.mode_pingpong)
						AnimationObject.speed_factor *= -1;
				}
			}
		}
		Runtime.AddEventHandler(AnimationTimer);
	}
}

function Play()
{

	if (!InitContext() )
		return;
	InitAnimation(AnimationIndex);
	if (AnimationObject)
	{
		AnimationObject.RefreshParams();
		AnimationObject.playing = true;
		AnimationObject.paused = false;
	}
}

function Pause()
{
	if (AnimationObject)
		AnimationObject.paused = !AnimationObject.paused;
}

function Rewind()
{
	if (AnimationObject)
	{
		AnimationObject.playing = false;
		AnimationObject.paused = false;
		AnimationObject.animation.CurrentTime = AnimationObject.time_start;
	}
}

function AnimMode(idx)
{
	if (AnimationObject)
	{
		switch (idx)
		{
		case 1 :
			AnimationObject.mode_pingpong = false;
			AnimationObject.mode_repeat = false;
			break;
		case 2 :
			AnimationObject.mode_pingpong = false;
			AnimationObject.mode_repeat = true;
			break;
		case 3 :
			AnimationObject.mode_pingpong = true;
			AnimationObject.mode_repeat = true;
			break;
		}
	}
}

//=================================================

var PMIState = true;

function TogglePMI()
{
	if (!InitContext() )
		return;
	PMIState = !PMIState;
	markups = Scene.Markups;
	for (idx = 0; idx < markups.Count; idx ++)
	{
		node = markups.GetByIndex(idx);
		node.visible = PMIState;
	}
	Scene.Update();
}

//=================================================

function HideSelected()
{
	if (!InitContext() )
		return;
	sel_nodes = Scene.SelectedNodes;
	for (idx = 0; idx < sel_nodes.Count; idx++)
	{
		node = sel_nodes.GetByIndex(idx);
		node.visible = false;
	}
	Scene.Update();
}

function HideUnselected()
{
	if (!InitContext() )
		return;
	all_nodes = Scene.Nodes;
	for (idx = 0; idx < all_nodes.Count; idx++)
	{
		node = all_nodes.GetByIndex(idx);
		node.visible = false;
	}
	sel_nodes = Scene.SelectedNodes;
	for (idx = 0; idx < sel_nodes.Count; idx++)
	{
		node = sel_nodes.GetByIndex(idx);
		node.visible = true;
	}
	Scene.Update();
}

function ShowAll()
{
	if (!InitContext() )
		return;
	for (idx = 0; idx < Scene.Nodes.Count; idx++)
	{
		node = Scene.Nodes.GetByIndex(idx);
		node.visible = true;
	}
	Scene.Update();
}

//=================================================

function InitBOM(bom_ctrl)
{
	if (!InitContext() )
		return;
	bom_ctrl.options.length = 0;
	parts = Scene.Parts;
	for (idx = 0; idx < parts.Count; idx++)
	{
		part = parts.Item(idx);
		AddOptionIntoSelect(bom_ctrl, part.name, idx);
	}
}

function CtrlBOMChange(part_idx)
{
	if (!InitContext() )
		return;
	Scene.SelectAll(false);
	part = Scene.Parts.Item(part_idx);
	if (typeof(part) != "undefined")
	{
		nodes = part.Nodes;
		for (idx = 0; idx < nodes.Count; idx++)
		{
			node = nodes.GetByIndex(idx);
			node.selected = true;
		}
	}
	Scene.Update();
}

//=================================================

function InitModelViews(views_ctrl)
{
	if (!InitContext() )
		return;
	views_ctrl.options.length = 0;
	views = Scene.Views;
	for (idx = 0; idx < views.Count; idx++)
	{
		view = views.GetByIndex(idx);
		AddOptionIntoSelect(views_ctrl, view.name, idx);
	}
}

function CtrlViewsChange(view_idx)
{
	if (!InitContext() )
		return;
	view = Scene.Views.GetByIndex(view_idx);
	if (typeof(view) != "undefined")
		view.Activate();
	Scene.Update();
}

//=================================================

function Print()
{
	if (!InitContext() )
		return;
	LocalEv3de.Print();
}

//=================================================

function InitAnimSeqs(aseq_ctrl)
{
	if (!InitContext() )
		return;
	aseq_ctrl.options.length = 0;
	for (idx = 0; idx < Scene.Animations.Count; idx++)
	{
		range = Scene.Animations.Item(idx);
		AddOptionIntoSelect(aseq_ctrl, range.name, idx);
	}
}

function CtrlAnimSeqsChange(aseq_idx)
{
	if (InitContext() )
	{
		Rewind();
		InitAnimation(aseq_idx);
	}
	Scene.Update();
}

//=================================================

function InitLayers(lays_ctrl)
{
	if (!InitContext() )
		return;
	lays_ctrl.options.length = 0;
	for (idx = 0; idx < Scene.Layers.Count; idx++)
	{
		lay = Scene.Layers.Item(idx);
		AddOptionIntoSelect(lays_ctrl, lay.name, idx);
	}
}

function CtrlLayersChange(lay_idx)
{
	if (!InitContext() )
		return;
	lay = Scene.Layers.Item(lay_idx);
	if (typeof(lay) != "undefined")
	{
		for (idx = 0; idx < Scene.Nodes.Count; idx++)
		{
			node = Scene.Nodes.GetByIndex(idx);
			node.visible = false;
		}
		for (idx = 0; idx < lay.Nodes.Count; idx++)
		{
			node = lay.Nodes.Item(idx);
			node.visible = true;
		}
	}
	Scene.Update();
}

//=================================================

var CtrlSteps;
var CtrlStepName;
var CtrlStepDesc;
var PlayAll = false;
var PlayProcedure = false;
var ProcedureIdx = -1;
var StepEventHandler = null;

function StepCmp(step_1, step_2)
{
	uid1 = step_1.UniqueID;
	uid2 = step_2.UniqueID;
	if ( (typeof(uid1) != "undefined") && (typeof(uid2) != "undefined") )
	{
		DebugOut(1, uid1.AssetID + ":" + uid1.SubID + ", " + uid2.AssetID + ":" + uid2.SubID);
		return (uid1.AssetID == uid2.AssetID) && (uid1.SubID == uid2.SubID);
	}
//	DebugOut(2, "compare by names: " + step_1.name + " with " + step_2.name);
//	return (step_1.name == step_2.name);
	return (step_1 == step_2);
}

function StepToIndex(step)
{
	res = -1;
	for (idx = 0; idx < Scene.Steps.Count; idx ++)
	{
		tmp_step = Scene.Steps.GetByIndex(idx);
		if (StepCmp(step, tmp_step) )
		{
			res = idx;
			break;
		}
	}
	return res;
}

function StepIndexToProcStepIndex(proc_idx, step_idx)
{
	res = -1;
	procs_coll = Scene.Procedures;
	if (typeof(procs_coll) == "undefined")
		return res;
	if ( (0 <= proc_idx) && (proc_idx < procs_coll.Count) )
	{
		proc = procs_coll.GetByIndex(proc_idx);
		step = Scene.Steps.GetByIndex(step_idx);
		for (idx = 0; idx < proc.Steps.Count; idx ++)
		{
			tmp_step = proc.Steps.GetByIndex(idx);
			if (StepCmp(step, tmp_step) )
			{
				res = idx;
				break;
			}
		}
	}
	DebugOut(1, "prc: " + proc_idx + ", stp: " + step_idx + ", psi: " + res);
	return res;
}

function ProcStepIndexToStepIndex(proc_idx, step_idx)
{
	res = -1;
	procs_coll = Scene.Procedures;
	if (typeof(procs_coll) == "undefined")
		return res;
	if ( (0 <= proc_idx) && (proc_idx < procs_coll.Count) )
	{
		proc = procs_coll.GetByIndex(proc_idx);
		step = proc.Steps.GetByIndex(step_idx);
		for (idx = 0; idx < Scene.Steps.Count; idx ++)
		{
			tmp_step = Scene.Steps.GetByIndex(idx);
			if (StepCmp(step, tmp_step) )
			{
				res = idx;
				break;
			}
		}
	}
	return res;
}

function GetNextStepIndexInProc(proc_idx, step_idx)
{
	res = -1;
	procs_coll = Scene.Procedures;
	if (typeof(procs_coll) == "undefined")
		return res;
	if ( (0 <= proc_idx) && (proc_idx < procs_coll.Count) )
	{
		proc = procs_coll.GetByIndex(proc_idx);
		if (step_idx >= proc.Steps.Count -1)
			return res;
		tmp_idx = step_idx +1;
		step = proc.Steps.GetByIndex(tmp_idx);
		for (idx = 0; idx < Scene.Steps.Count; idx ++)
		{
			tmp_step = Scene.Steps.GetByIndex(idx);
			if (StepCmp(step, tmp_step) )
			{
				res = idx;
				break;
			}
		}
	}
	DebugOut(1, "prc: " + proc_idx + ", stp: " + step_idx + ", psi: " + res);
	return res;
}

function InitSteps(steps_ctrl, step_name_ctrl, step_desc_ctrl)
{
	if (!InitContext() )
		return;
	CtrlSteps = steps_ctrl;
	CtrlStepName = step_name_ctrl;
	CtrlStepDesc = step_desc_ctrl;
	steps_ctrl.options.length = 0;
	for (idx = 0; idx < Scene.Steps.Count; idx++)
	{
		step = Scene.Steps.GetByIndex(idx);
		AddOptionIntoSelect(steps_ctrl, step.name, idx);
	}
	if (StepEventHandler == null)
	{
		StepEventHandler = Creator.StepEventHandler.Create();
		StepEventHandler.onEvent = StepEvent;
		Runtime.AddEventHandler(StepEventHandler);
	}
}


function PlayStep(idx)
{
	if (!InitContext() )
		return;
	if ( (0 <= idx) && (idx < Scene.Steps.Count) )
	{
		step = Scene.Steps.GetByIndex(idx);
		for (i = 0; i < CtrlSteps.length; i++)
			CtrlSteps.options[i].selected = (idx == CtrlSteps.options[i].value);
		SetDescriptionText(CtrlStepName, step.Name);
		SetDescriptionText(CtrlStepDesc, step.Description);
		step.Play();
	}
}

function PlaySingleStep(idx)
{
	PlayAll = false;
	PlayStep(idx);
}

function CtrlStepsChange(idx)
{
	if (!InitContext() )
		return;
	PlaySingleStep(idx);
}

function StepEvent(evnt)
{
	if (!InitContext() )
		return;
	if (evnt.isStepStarted)
	{
		idx = Scene.CurrentStep;
		for (i = 0; i < CtrlSteps.length; i++)
			CtrlSteps.options[i].selected = (idx == CtrlSteps.options[i].value);
		if ( (0 <= idx) && (idx < Scene.Steps.Count) )
		{
			step = Scene.Steps.GetByIndex(idx);
			SetDescriptionText(CtrlStepName, step.Name);
			SetDescriptionText(CtrlStepDesc, step.Description);
		}
	}
	if (!evnt.isStepFinished)
		return;
	if (PlayAll)
	{
		if (Scene.CurrentStep < Scene.Steps.Count -1)
			PlayStep(Scene.CurrentStep +1);
		else
			PlayAll = false;
	}
	if (PlayProcedure)
	{
		cur_step_idx = StepIndexToProcStepIndex(ProcedureIdx, Scene.CurrentStep);
		new_step_idx = GetNextStepIndexInProc(ProcedureIdx, cur_step_idx);
		DebugOut(1, "cur:" + cur_step_idx + ", new: " + new_step_idx);
		if (new_step_idx < 0)
		{
			PlayAll = false;
			PlayProcedure = false;
		}
		else
			PlayStep(new_step_idx);
	}
}


function PlayCurrStep()
{
	if (!InitContext() )
		return;
	if ( (0 <= Scene.CurrentStep) && (Scene.Steps.Count > Scene.CurrentStep) )
		PlaySingleStep(Scene.CurrentStep);
	else
		PlaySingleStep(0);
}

function PauseCurrStep()
{
	if (!InitContext() )
		return;
	pause_state = Scene.IsCurrentStepPaused;
	Scene.PauseCurrentStep(!pause_state);
}

function RewindCurrStep()
{
	if (!InitContext() )
		return;
	step_idx = Scene.CurrentStep;
	step = Scene.Steps.GetByIndex(step_idx);
	step.Play();
	Scene.StopCurrentStep();
	if (false) // step.Sequences.Count > 0)
	{
		aseq = step.Sequences.GetByIndex(0);
		if (typeof(aseq) != "undefined")
		{
			anim = undefined;
			for (a_idx = 0; a_idx < Scene.Animations.Count; a_idx++)
			{
				tmp_anim = Scene.Animations.GetByIndex(a_idx);
				if (tmp_anim.ObjectID == aseq.ObjectID)
				{
					anim = tmp_anim;
					break;
				}
			}
			if (typeof(anim) != "undefined")
			{
				Scene.ActivateAnimation(anim);
				anim.CurrentTime = aseq.isReversed ? anim.EndTime : anim.StartTime;
			}
		}
	}
}

function FirstStep()
{
	PlaySingleStep(0);
}

function NextStep()
{
	if (InitContext() )
		PlaySingleStep(Scene.CurrentStep +1);
}

function PlayAllSteps(from_proc)
{
	if (!InitContext() )
		return;
	if (StepEventHandler == null)
	{
		StepEventHandler = Creator.StepEventHandler.Create();
		StepEventHandler.onEvent = StepEvent;
		Runtime.AddEventHandler(StepEventHandler);
	}
	step_idx = from_proc ? ProcStepIndexToStepIndex(ProcedureIdx, 0) : 0;
	PlayAll = !from_proc;
	PlayProcedure = from_proc;
	PlayStep(step_idx);
}

function ResetSteps(from_proc)
{
	PlayAll = false;
	PlayProcedure = false;
	step_idx = from_proc ? ProcStepIndexToStepIndex(ProcedureIdx, 0) : 0;
	PlaySingleStep(step_idx);
	Scene.StopCurrentStep();
}

function PrevStep()
{
	if (InitContext() )
		PlaySingleStep(Scene.CurrentStep -1);
}

function LastStep()
{
	if (!InitContext() )
		return;
	if (Scene.Steps.Count > 0)
		PlaySingleStep(Scene.Steps.Count -1);
}

//=================================================

function InitProcedures(proc_ctrl, step_ctrl)
{
	CtrlSteps = step_ctrl;
	if (!InitContext() )
		return;
	proc_ctrl.options.length = 0;
	procs_coll = Scene.Procedures;
	if (typeof(procs_coll) == "undefined")
		return;
	for (idx = 0; idx < procs_coll.Count; idx ++)
	{
		proc = procs_coll.GetByIndex(idx);
		AddOptionIntoSelect(proc_ctrl, proc.Name, idx);
	}
}

function CtrlProcedureChange(idx, auto_play)
{
	if (!InitContext() )
		return;
	ProcedureIdx = idx;
	CtrlSteps.options.length = 0;
	proc = Scene.Procedures.GetByIndex(idx);
	for (idx = 0; idx < proc.Steps.Count; idx ++)
	{
		step_idx = ProcStepIndexToStepIndex(ProcedureIdx, idx);
		AddOptionIntoSelect(CtrlSteps, step.Name, step_idx);
	}
	if (auto_play)
		PlayAllSteps(true);
}

//=================================================

//=================================================
//=================================================
