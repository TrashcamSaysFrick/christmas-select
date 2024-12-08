-- name: [CS] Christmas Select
-- description: A Character Select Collab Pack for the Holiday Season!

local TEXT_MOD_NAME = "Christmas Select"

if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
    return 0
end

local E_MODEL_WHITEY = smlua_model_util_get_id("Whitey_geo")
local E_MODEL_MUNKSHROOM = smlua_model_util_get_id("alvin_munkshroom_geo")
local E_MODEL_ARTHUR = smlua_model_util_get_id("arthurxmas_geo")
local E_MODEL_SNOWKING = smlua_model_util_get_id("snowking_geo")

local TEX_WHITEY_LIFE_ICON = get_texture_info("whitey") -- Located in "textures"
local TEX_MUNKSHROOM_LIFE_ICON = get_texture_info("alvin") -- Located in "textures"
local TEX_ARTHUR_LIFE_ICON = get_texture_info("arthurxmas-icon") -- Located in "textures"
local TEX_SNOWKING = get_texture_info("snowking_icon")

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
    [CHAR_SOUND_COUGHING1] = 'MUNKSHROOM_SOUND_COUGHING1.ogg',
    [CHAR_SOUND_COUGHING2] = 'MUNKSHROOM_SOUND_COUGHING2.ogg',
    [CHAR_SOUND_COUGHING3] = 'MUNKSHROOM_SOUND_COUGHING3.ogg',
    [CHAR_SOUND_DOH] = 'MUNKSHROOM_SOUND_DOH.ogg',
    [CHAR_SOUND_DROWNING] = "MUNKSHROOM_SOUND_DROWNING.ogg",
    [CHAR_SOUND_DYING] = 'MUNKSHROOM_SOUND_DYING.ogg',
    [CHAR_SOUND_EEUH] = 'MUNKSHROOM_SOUND_EEUH.ogg',
    [CHAR_SOUND_GROUND_POUND_WAH] = 'MUNKSHROOM_SOUND_GROUND_POUND_WAH.ogg',
    [CHAR_SOUND_HAHA] = 'MUNKSHROOM_SOUND_HAHA.ogg',
    [CHAR_SOUND_HAHA_2] = 'MUNKSHROOM_SOUND_HAHA.ogg',
    [CHAR_SOUND_LETS_A_GO] = 'MUNKSHROOM_SOUND_LETS_A_GO.ogg',
    [CHAR_SOUND_HERE_WE_GO] = 'MUNKSHROOM_SOUND_HERE_WE_GO.ogg',
    [CHAR_SOUND_HRMM] = 'MUNKSHROOM_SOUND_HRMM.ogg',
    [CHAR_SOUND_HOOHOO] = 'MUNKSHROOM_SOUND_HOOHOO.ogg',
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
    [CHAR_SOUND_WHOA] = 'MUNKSHROOM_SOUND_WHOA.ogg',
    [CHAR_SOUND_YAHOO] = 'MUNKSHROOM_SOUND_YAHOO.ogg',
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'MUNKSHROOM_SOUND_YAHOO.ogg', 'MUNKSHROOM_SOUND_WAHA.ogg', 'MUNKSHROOM_SOUND_YIPPEE.ogg'},
    [CHAR_SOUND_YAH_WAH_HOO] = {'MUNKSHROOM_SOUND_YAH.ogg', 'MUNKSHROOM_SOUND_WAH.ogg', 'MUNKSHROOM_SOUND_HOO.ogg'},
    [CHAR_SOUND_IMA_TIRED] = 'MUNKSHROOM_SOUND_IMA_TIRED.ogg',
    [CHAR_SOUND_YAWNING] = 'MUNKSHROOM_SOUND_YAWNING.ogg',
    [CHAR_SOUND_SNORING1] = 'MUNKSHROOM_SOUND_SNORING1.ogg',
    [CHAR_SOUND_SNORING2] = 'sk_CHAR_SOUND_SNORING2.ogg',
    [CHAR_SOUND_SNORING3] = {'MUNKSHROOM_SOUND_SNORING2.ogg', 'MUNKSHROOM_SOUND_SNORING1.ogg', 'MUNKSHROOM_SOUND_SNORING3.ogg'},
}

local VOICETABLE_SNOWKING = {
    [CHAR_SOUND_ATTACKED] = {'sk_CHAR_SOUND_ATTACKED.ogg'},
    [CHAR_SOUND_COUGHING1] = 'sk_CHAR_SOUND_COUGHING1.ogg',
    [CHAR_SOUND_COUGHING2] = 'sk_CHAR_SOUND_COUGHING2.ogg',
    [CHAR_SOUND_COUGHING3] = 'sk_CHAR_SOUND_COUGHING3.ogg',
    [CHAR_SOUND_DOH] = {'sk_CHAR_SOUND_DOH.ogg'},
    [CHAR_SOUND_DROWNING] = 'sk_CHAR_SOUND_DROWNING.ogg',
    [CHAR_SOUND_DYING] = 'sk_CHAR_SOUND_DYING.ogg',
    [CHAR_SOUND_EEUH] = 'sk_CHAR_SOUND_EEUH.ogg',
    [CHAR_SOUND_GROUND_POUND_WAH] = 'sk_CHAR_SOUND_GROUND_POUND_WAH.ogg',
    [CHAR_SOUND_HAHA] = 'sk_CHAR_SOUND_HAHA.ogg',
    [CHAR_SOUND_HAHA_2] = 'sk_CHAR_SOUND_HAHA_2.ogg',
    [CHAR_SOUND_HERE_WE_GO] = 'sk_CHAR_SOUND_HERE_WE_GO.ogg',
    [CHAR_SOUND_HOOHOO] = {'sk_CHAR_SOUND_HOOHOO1.ogg', 'sk_CHAR_SOUND_HOOHOO2.ogg','sk_CHAR_SOUND_HOOHOO3.ogg'},
    [CHAR_SOUND_HRMM] = 'sk_CHAR_SOUND_HRMM.ogg',
    [CHAR_SOUND_IMA_TIRED] = 'sk_CHAR_SOUND_IMA_TIRED.ogg',
    [CHAR_SOUND_MAMA_MIA] = 'sk_CHAR_SOUND_MAMA_MIA.ogg',
    [CHAR_SOUND_LETS_A_GO] = 'sk_CHAR_SOUND_LETS_A_GO.ogg',
    [CHAR_SOUND_ON_FIRE] = 'sk_CHAR_SOUND_ON_FIRE.ogg',
    [CHAR_SOUND_OOOF] = 'sk_CHAR_SOUND_OOOF.ogg',
    [CHAR_SOUND_OOOF2] = 'sk_CHAR_SOUND_OOOF2.ogg',
    [CHAR_SOUND_PANTING] = 'sk_CHAR_SOUND_PANTING.ogg',
    [CHAR_SOUND_PANTING_COLD] = 'sk_CHAR_SOUND_PANTING.ogg',
    [CHAR_SOUND_PUNCH_HOO] = 'sk_CHAR_SOUND_PUNCH_HOO.ogg',
    [CHAR_SOUND_PUNCH_WAH] = 'sk_CHAR_SOUND_PUNCH_WAH.ogg',
    [CHAR_SOUND_PUNCH_YAH] = 'sk_CHAR_SOUND_PUNCH_YAH.ogg',
    [CHAR_SOUND_SO_LONGA_BOWSER] = 'sk_CHAR_SOUND_SO_LONGA_BOWSER.ogg',
    [CHAR_SOUND_SNORING1] = 'sk_CHAR_SOUND_SNORING1.ogg',
    [CHAR_SOUND_SNORING2] = 'sk_CHAR_SOUND_SNORING2.ogg',
    [CHAR_SOUND_SNORING3] = {'sk_CHAR_SOUND_SNORING2.ogg', 'sk_CHAR_SOUND_SNORING1.ogg', 'sk_CHAR_SOUND_SNORING3.ogg'},
    [CHAR_SOUND_TWIRL_BOUNCE] = 'sk_CHAR_SOUND_TWIRL_BOUNCE.ogg',
    [CHAR_SOUND_UH] = 'sk_CHAR_SOUND_UH.ogg',
    [CHAR_SOUND_UH2] = 'sk_CHAR_SOUND_UH.ogg',
    [CHAR_SOUND_UH2_2] = 'sk_CHAR_SOUND_UH.ogg',
    [CHAR_SOUND_WAAAOOOW] = 'sk_CHAR_SOUND_WAAAOOOW.ogg',
    [CHAR_SOUND_WAH2] = 'sk_CHAR_SOUND_GROUND_POUND_WAH.ogg',
    [CHAR_SOUND_WHOA] = 'sk_CHAR_SOUND_WHOA.ogg',
    [CHAR_SOUND_YAHOO] = 'sk_CHAR_SOUND_YAHOO.ogg',
    [CHAR_SOUND_YAWNING] = 'sk_CHAR_SOUND_YAWNING.ogg',
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = { 'sk_CHAR_SOUND_YAHOO_WAHA_YIPPEE1.ogg', 'sk_CHAR_SOUND_YAHOO_WAHA_YIPPEE2.ogg', 'sk_CHAR_SOUND_YAHOO_WAHA_YIPPEE3.ogg'},
    [CHAR_SOUND_YAH_WAH_HOO] = { 'sk_CHAR_SOUND_YAH_WAH_HOO1.ogg', 'sk_CHAR_SOUND_YAH_WAH_HOO2.ogg', 'sk_CHAR_SOUND_YAH_WAH_HOO3.ogg'},
    }

local PALETTE_WHITEY = {
    [PANTS]  = "675640",
    [SHIRT]  = "547435",
    [GLOVES] = "2d3357",
    [SHOES]  = "2E251c",
    [HAIR]   = "Fce3cb",
    [SKIN]   = "14192d",
    [CAP]    = "1e4526",
    [EMBLEM] = "c0c380",
}

    local PALETTE_ARTHUR = {
    [PANTS]  = "999be5",
    [SHIRT]  = "ffffff",
    [GLOVES] = "ffffff",
    [SHOES]  = "000000",
    [HAIR]   = "000000",
    [SKIN]   = "bb985e",
    [CAP]    = "000000",
    [EMBLEM] = "000000"
}
    local PALETTE_MUNKSHROOM = {
    [PANTS]  = "f0a976",
    [SHIRT]  = "ff0000",
    [GLOVES] = "ffffff",
    [SHOES]  = "2f2f2f",
    [HAIR]   = "ffffff",
    [SKIN]   = "fed5a1",
    [CAP]    = "ff0000",
    [EMBLEM] = "ffff51",
}

local PALETTE_SNOWKING = {
    [SHIRT] = "196788",
    [SHOES] = "992221",
    [HAIR] = "ffffff",
    [CAP] = "5A93F7",
    [PANTS] = "26FC26",
    [GLOVES] = "D6E1EB",
    [SKIN] = "C3942F",
    [EMBLEM] = "5A93F7",
}

local capSNOWKING = {
    normal = smlua_model_util_get_id("snowking_cap_geo"),
    wing = smlua_model_util_get_id("snowking_wing_cap_geo"),
    metal = smlua_model_util_get_id("snowking_metal_cap_geo"),
    metalWing = smlua_model_util_get_id("snowking_metal_wing_cap_geo")
}

local PM_SNOWKING= {
    label = {
        left = get_texture_info("snowking_PM1"),
        right = get_texture_info("snowking_PM2"),
    },
    pie = { 
        [1] = get_texture_info("PM-1"),
        [2] = get_texture_info("PM-2"),
        [3] = get_texture_info("PM-3"),
        [4] = get_texture_info("PM-4"),
        [5] = get_texture_info("PM-5"),
        [6] = get_texture_info("PM-6"),
        [7] = get_texture_info("PM-7"),
        [8] = get_texture_info("PM-8"),
        
    }
}

local CSloaded = false
local function on_character_select_load()
    CT_WHITEY = _G.charSelect.character_add("Whitey", {"Whitey Duvall from Adam Sandler's Eight Crazy Nights", "is now here."}, "Trashcam", {r = 255, g = 200, b = 200}, E_MODEL_WHITEY, CT_MARIO, TEX_WHITEY_LIFE_ICON)
    _G.charSelect.character_add_voice(E_MODEL_WHITEY, VOICETABLE_WHITEY)
    _G.charSelect.character_add_palette_preset(E_MODEL_WHITEY, PALETTE_WHITEY)
    CT_MUNKSHROOM = _G.charSelect.character_add("Alvin The Munkshroom", {"After a fierce battle to save the E3 Gnome", "Alvin the Munkshroom finds himself on", "The outskirts of the Princess' Castle."}, "MlopFunny, PainterSeap", {r = 255, g = 0, b = 0}, E_MODEL_MUNKSHROOM, CT_TOAD, TEX_MUNKSHROOM_LIFE_ICON)
    _G.charSelect.character_add_voice(E_MODEL_MUNKSHROOM, VOICETABLE_MUNKSHROOM)
    _G.charSelect.character_add_palette_preset(E_MODEL_MUNKSHROOM, PALETTE_MUNKSHROOM)
    CT_ARTHURXMAS = _G.charSelect.character_add("Arthur", {"Christmas will be magical", "Just like in a fairy tale."}, "CT Himself", {r = 255, g = 255, b = 255}, E_MODEL_ARTHUR, CT_MARIO, TEX_ARTHUR_LIFE_ICON)
    _G.charSelect.character_add_palette_preset(E_MODEL_ARTHUR, PALETTE_ARTHUR)
    CT_SNOWKING = _G.charSelect.character_add("Snow King", "Part of the CS Winter Collab! Here comes the Snow King from Mario Golf: Super Rush! Merry Christmas! VOICED BY Pyronoid!", "Melzinoff, Pyronoid!", {r = 255, g = 200, b = 200}, E_MODEL_SNOWKING, CT_MARIO, TEX_SNOWKING)
    _G.charSelect.character_add_caps(E_MODEL_SNOWKING, capSNOWKING)
    _G.charSelect.character_add_palette_preset(E_MODEL_SNOWKING, PALETTE_SNOWKING)
    _G.charSelect.character_add_health_meter(CT_SNOWKING, PM_SNOWKING)
    CSloaded = true
end

local function on_character_sound(m, sound)
    if not CSloaded then return end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_WHITEY then return _G.charSelect.voice.sound(m, sound) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_MUNKSHROOM then return _G.charSelect.voice.sound(m, sound) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_SNOWKING then return _G.charSelect.voice.sound(m, sound) end
end

local function on_character_snore(m)
    if not CSloaded then return end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_WHITEY then return _G.charSelect.voice.snore(m) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_MUNKSHROOM then return _G.charSelect.voice.snore(m) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_SNOWKING then return _G.charSelect.voice.snore(m) end
end

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)
hook_event(HOOK_CHARACTER_SOUND, on_character_sound)
hook_event(HOOK_MARIO_UPDATE, on_character_snore)
