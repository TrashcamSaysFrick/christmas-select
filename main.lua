-- name: [CS] Christmas Select
-- description: A Character Select Collab Pack for the Holiday Season!

local TEXT_MOD_NAME = "Christmas Select"

if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
    return 0
end

local E_MODEL_WHITEY = smlua_model_util_get_id("Whitey_geo")
local E_MODEL_MUNKSHROOM = smlua_model_util_get_id("alvin_munkshroom_geo")

local TEX_WHITEY_LIFE_ICON = get_texture_info("whitey") -- Located in "textures"
local TEX_MUNKSHROOM_LIFE_ICON = get_texture_info("alvin") -- Located in "textures"

local VOICETABLE_WHITEY = {
    [CHAR_SOUND_ATTACKED] = 'WhiteyHurtAAA.ogg',
    [CHAR_SOUND_DOH] = 'WhiteyHurtOh.ogg',
    [CHAR_SOUND_DROWNING] = nil,
    [CHAR_SOUND_DYING] = nil,
    [CHAR_SOUND_GROUND_POUND_WAH] = nil,
    [CHAR_SOUND_HAHA] = nil,
    [CHAR_SOUND_HAHA_2] = nil,
    [CHAR_SOUND_HERE_WE_GO] = 'Technical-Foul.ogg',
    [CHAR_SOUND_HOOHOO] = 'EEE.ogg',
    [CHAR_SOUND_MAMA_MIA] = 'This-Might-Be-Harder-Than-I-Thought.ogg',
    [CHAR_SOUND_OKEY_DOKEY] = 'Technical-Foul.ogg',
    [CHAR_SOUND_ON_FIRE] = 'WhiteyHurtAAA.ogg',
    [CHAR_SOUND_OOOF] = 'WhiteyHurtUgh.ogg',
    [CHAR_SOUND_OOOF2] = 'WhiteyHurtAugh.ogg',
    [CHAR_SOUND_PUNCH_HOO] = 'AAA.ogg',
    [CHAR_SOUND_PUNCH_WAH] = 'Wah.ogg',
    [CHAR_SOUND_PUNCH_YAH] = 'YEAAAH.ogg',
    [CHAR_SOUND_SO_LONGA_BOWSER] = 'Technical-Foul.ogg',
    [CHAR_SOUND_TWIRL_BOUNCE] = 'Yeahsadeh.ogg',
    [CHAR_SOUND_WAAAOOOW] = 'WhiteyHurtAAA.ogg',
    [CHAR_SOUND_WAH2] = nil,
    [CHAR_SOUND_WHOA] = nil,
    [CHAR_SOUND_YAHOO] = 'Dont-Forget.ogg',
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'Dont-Forget.ogg', 'Wah.ogg', 'YEAAAH.ogg'},
    [CHAR_SOUND_YAH_WAH_HOO] = {'YEAAAH.ogg', 'Wah.ogg', 'AAA.ogg'},
    [CHAR_SOUND_YAWNING] = nil,
}

local VOICETABLE_MUNKSHROOM = {
    [CHAR_SOUND_ATTACKED] = 'MUNKSHROOM_SOUND_ATTACKED.ogg',
    [CHAR_SOUND_DOH] = 'MUNKSHROOM_SOUND_DOH.ogg',
    [CHAR_SOUND_DROWNING] = "MUNKSHROOM_SOUND_DYING.ogg",
    [CHAR_SOUND_DYING] = 'MUNKSHROOM_SOUND_DYING.ogg',
    [CHAR_SOUND_EEUH] = 'MUNKSHROOM_SOUND_EEUH.ogg',
    [CHAR_SOUND_GROUND_POUND_WAH] = 'MUNKSHROOM_SOUND_GROUND_POUND_WAH.ogg',
    [CHAR_SOUND_HAHA] = 'MUNKSHROOM_SOUND_HAHA.ogg',
    [CHAR_SOUND_HAHA_2] = 'MUNKSHROOM_SOUND_HAHA.ogg',
    [CHAR_SOUND_LETS_A_GO] = 'MUNKSHROOM_SOUND_LETS_A_GO.ogg',
    [CHAR_SOUND_HERE_WE_GO] = 'MUNKSHROOM_SOUND_HERE_WE_GO.ogg',
    [CHAR_SOUND_HRMM] = 'MUNKSHROOM_SOUND_HRMM.ogg',
    [CHAR_SOUND_HOOHOO] = 'MUNKSHROOM_SOUND_UH.ogg',
    [CHAR_SOUND_UH2] = 'MUNKSHROOM_SOUND_UH2.ogg',
    [CHAR_SOUND_UH] = 'MUNKSHROOM_SOUND_UH.ogg',
    [CHAR_SOUND_UH2_2] = 'MUNKSHROOM_SOUND_UH2.ogg',
    [CHAR_SOUND_MAMA_MIA] = 'MUNKSHROOM_SOUND_MAMA_MIA.ogg',
    [CHAR_SOUND_ON_FIRE] = 'MUNKSHROOM_SOUND_ON_FIRE.ogg',
    [CHAR_SOUND_OOOF] = 'MUNKSHROOM_SOUND_OOOF.ogg',
    [CHAR_SOUND_OOOF2] = 'MUNKSHROOM_SOUND_OOOF.ogg',
    [CHAR_SOUND_PUNCH_HOO] = 'MUNKSHROOM_SOUND_PUNCH_HOO.ogg',
    [CHAR_SOUND_PUNCH_WAH] = 'MUNKSHROOM_SOUND_PUNCH_WAH.ogg',
    [CHAR_SOUND_PUNCH_YAH] = 'MUNKSHROOM_SOUND_PUNCH_YAH.ogg',
    [CHAR_SOUND_SO_LONGA_BOWSER] = 'MUNKSHROOM_SOUND_SO_LONGA_BOWSER.ogg',
    [CHAR_SOUND_TWIRL_BOUNCE] = 'MUNKSHROOM_SOUND_TWIRL_BOUNCE.ogg',
    [CHAR_SOUND_WAAAOOOW] = 'MUNKSHROOM_SOUND_WAAAOOOW.ogg',
    [CHAR_SOUND_WAH2] = 'MUNKSHROOM_SOUND_PUNCH_WAH.ogg',
    [CHAR_SOUND_YAHOO] = 'MUNKSHROOM_SOUND_YAHOO.ogg',
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'MUNKSHROOM_SOUND_YAHOO.ogg', 'MUNKSHROOM_SOUND_WAHA.ogg', 'MUNKSHROOM_SOUND_YIPPEE.ogg'},
    [CHAR_SOUND_YAH_WAH_HOO] = {'MUNKSHROOM_SOUND_PUNCH_YAH.ogg', 'MUNKSHROOM_SOUND_PUNCH_WAH.ogg', 'MUNKSHROOM_SOUND_PUNCH_HOO.ogg'},
    [CHAR_SOUND_YAWNING] = 'MUNKSHROOM_SOUND_IMA_TIRED',
}

local PALETTE_WHITEY = {
    [PANTS]  = "0066cc",
    [SHIRT]  = "feebf7",
    [GLOVES] = "fddfdb",
    [SHOES]  = "ff2d32",
    [HAIR]   = "51a5ed",
    [SKIN]   = "fddfdb",
    [CAP]    = "ff2d32",
    [EMBLEM] = "ff2d32",
}

--[[ 
    
    ILL DEAL W THIS LATER!!! HOLD TIGHT!!!

    local PALETTE_MUNKSHROOM = {
    [PANTS]  = "0066cc",
    [SHIRT]  = "feebf7",
    [GLOVES] = "fddfdb",
    [SHOES]  = "ff2d32",
    [HAIR]   = "51a5ed",
    [SKIN]   = "fddfdb",
    [CAP]    = "ff2d32",
    [EMBLEM] = "ff2d32",
}
]]--


local CSloaded = false
local function on_character_select_load()
    CT_WHITEY = _G.charSelect.character_add("Whitey", {"Whitey Duvall from Adam Sandler's Eight Crazy Nights", "is now here."}, "Trashcam", {r = 255, g = 200, b = 200}, E_MODEL_WHITEY, CT_MARIO, TEX_WHITEY_LIFE_ICON)
    _G.charSelect.character_add_voice(E_MODEL_WHITEY, VOICETABLE_WHITEY)
    _G.charSelect.character_add_palette_preset(E_MODEL_WHITEY, PALETTE_WHITEY)
    CT_MUNKSHROOM = _G.charSelect.character_add("Alvin The Munkshroom", {"After a fierce battle to save the E3 Gnome", "Alvin the Munkshroom finds himself on", "The outskirts of the Princess' Castle."}, "MlopFunny, PainterSeap", {r = 255, g = 0, b = 0}, E_MODEL_MUNKSHROOM, CT_TOAD, TEX_MUNKSHROOM_LIFE_ICON)
    _G.charSelect.character_add_voice(E_MODEL_MUNKSHROOM, VOICETABLE_MUNKSHROOM)
    CSloaded = true
end

local function on_character_sound(m, sound)
    if not CSloaded then return end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_WHITEY then return _G.charSelect.voice.sound(m, sound) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_MUNKSHROOM then return _G.charSelect.voice.sound(m, sound) end
end

local function on_character_snore(m)
    if not CSloaded then return end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_WHITEY then return _G.charSelect.voice.snore(m) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_MUNKSHROOM then return _G.charSelect.voice.snore(m) end
end

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)
hook_event(HOOK_CHARACTER_SOUND, on_character_sound)
hook_event(HOOK_MARIO_UPDATE, on_character_snore)