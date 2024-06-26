Constants = {}
Constants.MOD_ID = "__RefinedNetworkStorage__"
Constants.Settings = {
    RNS_Player_Port_Shortcut = "RNS_Player_Port_Shortcut",
    RNS_Default_Channel = "Default",
    RNS_PlayerPort_Consumption = 100,
    RNS_WirelessTransmitter_Tick = 30,
    RNS_Default_WirelessGrid_Distance = 32*3,
    RNS_Default_Gui_Distance = 10,
    RNS_CableUnderground_Reach = 8,
    RNS_Max_Priority = 5,
    RNS_Priorities = {},
    RNS_WirelessTransmitter_Color = "RNS_WirelessTransmitter_Area_Color",
    RNS_StorageDrive_Whitelist = "RNS_StorageDrive_Whitelist",
    RNS_DriveSprite_Offset = {
        [1] = {0, -0.45},
        [2] = {-0.5, -1.2},
        [3] = {0.5, -1.2},
        [4] = {-0.5, 0.3},
        [5] = {0.5, 0.3},
    },
    RNS_ColorG = {
        [1] = {"gui-description.RNS_RED"},
        [2] = {"gui-description.RNS_WHITE"},
        [3] = {"gui-description.RNS_PURPLE"},
        [4] = {"gui-description.RNS_PINK"},
        [5] = {"gui-description.RNS_ORANGE"},
        [6] = {"gui-description.RNS_LIGHTGREEN"},
        [7] = {"gui-description.RNS_LIGHTBLUE"},
        [8] = {"gui-description.RNS_GREY"},
        [9] = {"gui-description.RNS_GREEN"},
        [10] ={"gui-description.RNS_BROWN"},
    },
    RNS_ModeN = {
        [1] = "input",
        [2] = "output",
        [3] = "input/output"
    },
    RNS_TypeN = {
        [1] = "item",
        [2] = "fluid"
    },
    RNS_Modes = {
        ["input"] = 1,
        ["output"] = 2,
        ["input/output"] = 3
    },
    RNS_Types = {
        ["item"] = 1,
        ["fluid"] = 2
    },
    RNS_ColorN = {
        [1] = "RED",
        [2] = "WHITE",
        [3] = "PURPLE",
        [4] = "PINK",
        [5] = "ORANGE",
        [6] = "LIGHTGREEN",
        [7] = "LIGHTBLUE",
        [8] = "GREY",
        [9] = "GREEN",
        [10] = "BROWN",
    },
    RNS_Colors = {
        ["RED"] = 1,
        ["WHITE"] = 2,
        ["PURPLE"] = 3,
        ["PINK"] = 4,
        ["ORANGE"] = 5,
        ["LIGHTGREEN"] = 6,
        ["LIGHTBLUE"] = 7,
        ["GREY"] = 8,
        ["GREEN"] = 9,
        ["BROWN"] = 10,
    },
    RNS_OperatorN = {
        [1] = ">",
        [2] = "<",
        [3] = "=",
        [4] = ">=",
        [5] = "<=",
        [6] = "!=",
    },
    RNS_Operators = {
        [">"] = 1,
        ["<"] = 2,
        ["="] = 3,
        [">="] = 4,
        ["<="] = 5,
        ["!="] = 6,
    },
    RNS_RoundRobin = "RNS_RoundRobin",
    RNS_BlankIcon32 = Constants.MOD_ID.."/graphics/blank32.png",
    RNS_BlankIcon128 = Constants.MOD_ID.."/graphics/blank128.png",
    RNS_FR_Cable = "RNS_FR_NetworkCable",
    RNS_Tag = "RNS_DataTag",
    RNS_BeltSides = {
        ["Right"] = 2,
        ["Left"] = 1,
    },
    RNS_Gui_Tick = 55,
    RNS_Detector_Tick = 3,
    RNS_ItemIO_Tick = 4,
    RNS_BaseItemIO_TransferCapacity = 1,
    RNS_FluidIO_Tick = 5,
    RNS_ExternalStorage_Tick = 5,
    RNS_BaseFluidIO_TransferCapacity = 100,
    RNS_TypesWithContainer = {
        ["ammo-turret"] = true,
        ["artillery-turret"] = true,
        ["artillery-wagon"] = true,
        ["assembling-machine"] = true,
        ["boiler"] = true,
        ["burner-generator"] = true,
        ["cargo-wagon"] = true,
        ["container"] = true,
        ["furnace"] = true,
        ["infinity-container"] = true,
        ["lab"] = true,
        ["linked-container"] = true,
        ["locomotive"] = true,
        ["logistic-container"] = true,
        ["reactor"] = true,
        ["roboport"] = true,
        ["rocket-silo"] = true,
        ["generator"] = true,
    },
    RNS_BeltTypes = {
        ["transport-belt"] = true,
        ["underground-belt"] = true,
        ["splitter"] = true,
        ["linked-belt"] = true,
        ["loader"] = true,
        ["loader-1x1"] = true
    },
    RNS_Inventory_Types = {
        ["rocket-silo"] = {
            input = {
                defines.inventory.rocket_silo_rocket,
                defines.inventory.rocket_silo_input,
            },
            output = {
                defines.inventory.rocket_silo_result,
                defines.inventory.rocket_silo_output,
            }
        },
        ["mining-drill"] = {
            input = {
                defines.inventory.fuel,
            },
            output = {
                defines.inventory.burnt_result,
                defines.inventory.chest,
            }
        },
        ["reactor"] = {
            input = {
                defines.inventory.fuel,
            },
            output = {
                defines.inventory.burnt_result,
            }
        },
        ["locomotive"] = {
            input = {
                defines.inventory.fuel,
            },
            output = {
                defines.inventory.burnt_result,
            }
        },
        ["lab"] = {
            input = {
                defines.inventory.lab_input,
                defines.inventory.fuel,
            },
            output = {
                defines.inventory.burnt_result,
            }
        },
        ["cargo-wagon"] = {
            input = {
                defines.inventory.cargo_wagon,
            },
            output = {
                defines.inventory.cargo_wagon,
            }
        },
        ["burner-generator"] = {
            input = {
                defines.inventory.fuel,
            },
            output = {
                defines.inventory.burnt_result,
            }
        },
        ["boiler"] = {
            input = {
                defines.inventory.fuel,
            },
            output = {
                defines.inventory.burnt_result,
            }
        },
        ["artillery-wagon"] = {
            input = {
                defines.inventory.artillery_wagon_ammo,
            },
            output = {
                defines.inventory.artillery_wagon_ammo,
            }
        },
        ["artillery-turret"] = {
            input = {
                defines.inventory.artillery_turret_ammo,
            },
            output ={
                defines.inventory.artillery_turret_ammo,
            }
        },
        ["ammo-turret"] = {
            input = {
                defines.inventory.turret_ammo,
            },
            output = {
                defines.inventory.turret_ammo,
            }
        },
        ["roboport"] = {
            input = {
                defines.inventory.roboport_robot,
                defines.inventory.roboport_material,
            },
            output = {
                defines.inventory.roboport_robot,
                defines.inventory.roboport_material,
            }
        },
        ["rocket-silo-rocket"] = {
            input = {
                defines.inventory.rocket,
            },
            output = {
                defines.inventory.rocket,
            }
        },
        ["logistic-container"] = {
            input = {
                defines.inventory.chest,
            },
            output = {
                defines.inventory.chest,
            }
        },
        ["linked-container"] = {
            input = {
                defines.inventory.chest,
            },
            output = {
                defines.inventory.chest,
            }
        },
        ["container"] = {
            input = {
                defines.inventory.chest,
            },
            output = {
                defines.inventory.chest,
            }
        },
        ["infinity-container"] = {
            input = {
                defines.inventory.chest,
            },
            output = {
                defines.inventory.chest,
            }
        },
        ["furnace"] = {
            input = {
                defines.inventory.fuel,
                defines.inventory.furnace_source,
            },
            output = {
                defines.inventory.burnt_result,
                defines.inventory.furnace_result,
            }
        },
        ["assembling-machine"] = {
            input = {
                defines.inventory.assembling_machine_input,
                defines.inventory.fuel,
            },
            output = {
                defines.inventory.assembling_machine_output,
                defines.inventory.burnt_result,
            }
        }
    },
    RNS_Gui = {
        drag_area_size = 25,
        close_button_size = 20,
        default_gui_width = 10,
        default_gui_height = 10,
        tooltip = "tooltip_gui",
        orange = {255, 131, 0},
        blue = {108, 114, 229},
        red = {255, 0, 0},
        white = {255, 255, 255},
        yellow_title = "yellow_label",
        frame_1 = "Frame_1",
        button_1 = "Button_1",
        button_2 = "Button_2",
        title_font = "TitleFont",
        label_font = "LabelFont",
        label_font_2 = "LabelFont2",
        scroll_pane = "Scroll_Pane",
        checkbox = "Checkbox",
        checkbox_middle = "Checkbox_Middle",
        checkbox_blank = "Checkbox_Blank"
    },
    Multipliers = {
        IIO = {},
        FIO = {},
        WT = {}
    }
}
for i=1, 8 do
    Constants.Settings.Multipliers.IIO[i] = (Constants.Settings.Multipliers.IIO[i-1] or 1) + ((Constants.Settings.Multipliers.IIO[i-1] or 1) < 3 and 1 or i%2+2)
    Constants.Settings.Multipliers.FIO[i] = (Constants.Settings.Multipliers.FIO[i-1] or 1) + ((Constants.Settings.Multipliers.FIO[i-1] or 1) < 3 and 1 or i%2+2)
end
for i=1, 4 do
    Constants.Settings.Multipliers.WT[i] = (Constants.Settings.Multipliers.WT[i-1] or 1) + 1
end

local j = 1
for i = Constants.Settings.RNS_Max_Priority, -Constants.Settings.RNS_Max_Priority, -1 do
    Constants.Settings.RNS_Priorities[j] = i
    j = j + 1
end
Constants.ItemGroup = {
    Category = {
        group = "RefinedNetworkStorage",
        subgroup = "RNS",
        ItemDrive_subgroup = "RNS-ItemDrives",
        FluidDrive_subgroup = "RNS-FluidDrives",
        Laser_subgroup = "RNS-Lasers",
        Cable_subgroup = "RNS-ColoredCables",
        Intermediate_subgroup = "RNS-Intermediates"
    }
}
Constants.Icons = {
    item = 'utility.indication_arrow',
    line = 'utility.indication_line',
    fluid = 'utility.fluid_indication_arrow',
    underground = {
        target = {
            name = "RNS_underground_target",
            sprite = "__core__/graphics/cursor-boxes-32x32.png"
        },
        gap = {
            name = "RNS_underground_gap",
            sprite = Constants.MOD_ID.."/graphics/underground-line.png"
        }
    },
    storage = {
        name = "RNS_storage_indication_arrow",
        sprite = Constants.MOD_ID.."/graphics/Cables/IO/storage-indication-arrow.png"
    },
    select_icon_black = "RNS_select_icon_black",
    select_icon_white = "RNS_select_icon_white",
    insert_arrow = {
        name = "RNS_insert_arrow",
        sprite = Constants.MOD_ID.."/graphics/insert_arrow.png"
    },
    storage_bothways = {
        name = "RNS_storage_indication_arrow_bothways",
        sprite = Constants.MOD_ID.."/graphics/Cables/IO/storage-indication-arrow-both-ways.png"
    },
    check_mark = {
        name = "RNS_check_mark_icon",
        sprite = Constants.MOD_ID.."/graphics/check-mark.png"
    },
    x_mark = {
        name = "RNS_x_mark_icon",
        sprite = Constants.MOD_ID.."/graphics/x-mark.png"
    },
}
Constants.Intermediates = {
    SiliconWafer = {
        name = "RNS_SiliconWafer",
        itemIcon = Constants.MOD_ID.."/graphics/silicon_wafer.png",
        order = "1"
    },
    CalculatorProcessor = {
        name = "RNS_CalculatorProcessor",
        itemIcon = Constants.MOD_ID.."/graphics/calculator_processor.png",
        order = "2"
    },
    LogicProcessor = {
        name = "RNS_LogicProcessor",
        itemIcon = Constants.MOD_ID.."/graphics/logic_processor.png",
        order = "3"
    },
    EngineeringProcessor = {
        name = "RNS_EngineeringProcessor",
        itemIcon = Constants.MOD_ID.."/graphics/engineering_processor.png",
        order = "4"
    }
}
Constants.PlayerPort = {
    name = "RNS_PlayerPort",
    itemIcon = Constants.MOD_ID.."/graphics/personalPlayerPort.png",
}
Constants.Detector = {
    name = "RNS_Detector",
    itemIcon = Constants.MOD_ID.."/graphics/Networks/Detector/DetectorI.png",
    entityE =  Constants.MOD_ID.."/graphics/Networks/Detector/DetectorE.png",
    entityS =  Constants.MOD_ID.."/graphics/Networks/Detector/DetectorS.png",
}
Constants.NetworkCables = {
    itemIO = {
        name = "RNS_NetworkCableIOItem",
        itemIcon = Constants.MOD_ID.."/graphics/Cables/IO/ItemIO.png",
        entityE =  Constants.MOD_ID.."/graphics/Cables/IO/ItemIOSheet_E.png",
        entityS =  Constants.MOD_ID.."/graphics/Cables/IO/IOSheet_S.png"
    },
    fluidIO = {
        name = "RNS_NetworkCableIOFluid",
        itemIcon = Constants.MOD_ID.."/graphics/Cables/IO/FluidIO.png",
        entityE =  Constants.MOD_ID.."/graphics/Cables/IO/FluidIOSheet_E.png",
        entityS =  Constants.MOD_ID.."/graphics/Cables/IO/FluidIOSheet_S.png"
    },
    externalIO = {
        name = "RNS_NetworkCableIOExternal",
        itemIcon = Constants.MOD_ID.."/graphics/Cables/IO/ExternalIO.png",
        entityE =  Constants.MOD_ID.."/graphics/Cables/IO/ExternalIOSheet_E.png",
        entityS =  Constants.MOD_ID.."/graphics/Cables/IO/IOSheet_S.png"
    },
    wirelessTransmitter = {
        name = "RNS_WirelessTransmitter",
        itemIcon = Constants.MOD_ID.."/graphics/Networks/Wireless/WirelessTransmitterI.png",
        entityE =  Constants.MOD_ID.."/graphics/Networks/Wireless/WirelessTransmitterE.png",
        entityS =  Constants.MOD_ID.."/graphics/Networks/Wireless/WirelessTransmitterS.png"
    },
    Cables = {
        RED = {
            cable = {
                name = "RNS_NetworkCable_RED",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/Red/NetworkCableRed.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/Red/NetworkCableRedPlate.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableBlank_S.png",
            },
            underground = {
                name = "RNS_NetworkCableRamp_RED",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/Red/NetworkCableRedRamp.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/Red/NetworkCableRedRamps.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableRampS.png",
            },
            sprites = {
                [1] = {
                    name = "RNS_NetworkCableNorth_RED",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Red/NetworkCableRedN.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableN_S.png",
                },
                [2] = {
                    name = "RNS_NetworkCableEast_RED",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Red/NetworkCableRedE.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableE_S.png",
                },
                [4] = {
                    name = "RNS_NetworkCableSouth_RED",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Red/NetworkCableRedS.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableS_S.png",
                },
                [3] = {
                    name = "RNS_NetworkCableWest_RED",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Red/NetworkCableRedW.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableW_S.png",
                },
                [5] = {
                    name = "RNS_NetworkCableDot_RED",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Red/NetworkCableRedDot.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableDot_S.png",
                }
            }
        },
        WHITE = {
            cable = {
                name = "RNS_NetworkCable_WHITE",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/White/NetworkCableWhite.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/White/NetworkCableWhitePlate.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableBlank_S.png",
            },
            underground = {
                name = "RNS_NetworkCableRamp_WHITE",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/White/NetworkCableWhiteRamp.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/White/NetworkCableWhiteRamps.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableRampS.png",
            },
            sprites = {
                [1] = {
                    name = "RNS_NetworkCableNorth_WHITE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/White/NetworkCableWhiteN.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableN_S.png",
                },
                [2] = {
                    name = "RNS_NetworkCableEast_WHITE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/White/NetworkCableWhiteE.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableE_S.png",
                },
                [4] = {
                    name = "RNS_NetworkCableSouth_WHITE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/White/NetworkCableWhiteS.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableS_S.png",
                },
                [3] = {
                    name = "RNS_NetworkCableWest_WHITE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/White/NetworkCableWhiteW.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableW_S.png",
                },
                [5] = {
                    name = "RNS_NetworkCableDot_WHITE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/White/NetworkCableWhiteDot.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableDot_S.png",
                }
            }
        },
        PURPLE = {
            cable = {
                name = "RNS_NetworkCable_PURPLE",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/Purple/NetworkCablePurple.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/Purple/NetworkCablePurplePlate.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableBlank_S.png",
            },
            underground = {
                name = "RNS_NetworkCableRamp_PURPLE",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/Purple/NetworkCablePurpleRamp.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/Purple/NetworkCablePurpleRamps.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableRampS.png",
            },
            sprites = {
                [1] = {
                    name = "RNS_NetworkCableNorth_PURPLE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Purple/NetworkCablePurpleN.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableN_S.png",
                },
                [2] = {
                    name = "RNS_NetworkCableEast_PURPLE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Purple/NetworkCablePurpleE.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableE_S.png",
                },
                [4] = {
                    name = "RNS_NetworkCableSouth_PURPLE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Purple/NetworkCablePurpleS.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableS_S.png",
                },
                [3] = {
                    name = "RNS_NetworkCableWest_PURPLE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Purple/NetworkCablePurpleW.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableW_S.png",
                },
                [5] = {
                    name = "RNS_NetworkCableDot_PURPLE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Purple/NetworkCablePurpleDot.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableDot_S.png",
                }
            }
        },
        PINK = {
            cable = {
                name = "RNS_NetworkCable_PINK",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/Pink/NetworkCablePink.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/Pink/NetworkCablePinkPlate.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableBlank_S.png",
            },
            underground = {
                name = "RNS_NetworkCableRamp_PINK",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/Pink/NetworkCablePinkRamp.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/Pink/NetworkCablePinkRamps.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableRampS.png",
            },
            sprites = {
                [1] = {
                    name = "RNS_NetworkCableNorth_PINK",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Pink/NetworkCablePinkN.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableN_S.png",
                },
                [2] = {
                    name = "RNS_NetworkCableEast_PINK",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Pink/NetworkCablePinkE.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableE_S.png",
                },
                [4] = {
                    name = "RNS_NetworkCableSouth_PINK",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Pink/NetworkCablePinkS.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableS_S.png",
                },
                [3] = {
                    name = "RNS_NetworkCableWest_PINK",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Pink/NetworkCablePinkW.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableW_S.png",
                },
                [5] = {
                    name = "RNS_NetworkCableDot_PINK",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Pink/NetworkCablePinkDot.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableDot_S.png",
                }
            }
        },
        ORANGE = {
            cable = {
                name = "RNS_NetworkCable_ORANGE",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/Orange/NetworkCableOrange.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/Orange/NetworkCableOrangePlate.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableBlank_S.png",
            },
            underground = {
                name = "RNS_NetworkCableRamp_ORANGE",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/Orange/NetworkCableOrangeRamp.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/Orange/NetworkCableOrangeRamps.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableRampS.png",
            },
            sprites = {
                [1] = {
                    name = "RNS_NetworkCableNorth_ORANGE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Orange/NetworkCableOrangeN.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableN_S.png",
                },
                [2] = {
                    name = "RNS_NetworkCableEast_ORANGE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Orange/NetworkCableOrangeE.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableE_S.png",
                },
                [4] = {
                    name = "RNS_NetworkCableSouth_ORANGE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Orange/NetworkCableOrangeS.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableS_S.png",
                },
                [3] = {
                    name = "RNS_NetworkCableWest_ORANGE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Orange/NetworkCableOrangeW.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableW_S.png",
                },
                [5] = {
                    name = "RNS_NetworkCableDot_ORANGE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Orange/NetworkCableOrangeDot.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableDot_S.png",
                }
            }
        },
        LIGHTGREEN = {
            cable = {
                name = "RNS_NetworkCable_LIGHTGREEN",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/LightGreen/NetworkCableLightGreen.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/LightGreen/NetworkCableLightGreenPlate.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableBlank_S.png",
            },
            underground = {
                name = "RNS_NetworkCableRamp_LIGHTGREEN",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/LightGreen/NetworkCableLightGreenRamp.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/LightGreen/NetworkCableLightGreenRamps.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableRampS.png",
            },
            sprites = {
                [1] = {
                    name = "RNS_NetworkCableNorth_LIGHTGREEN",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/LightGreen/NetworkCableLightGreenN.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableN_S.png",
                },
                [2] = {
                    name = "RNS_NetworkCableEast_LIGHTGREEN",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/LightGreen/NetworkCableLightGreenE.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableE_S.png",
                },
                [4] = {
                    name = "RNS_NetworkCableSouth_LIGHTGREEN",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/LightGreen/NetworkCableLightGreenS.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableS_S.png",
                },
                [3] = {
                    name = "RNS_NetworkCableWest_LIGHTGREEN",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/LightGreen/NetworkCableLightGreenW.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableW_S.png",
                },
                [5] = {
                    name = "RNS_NetworkCableDot_LIGHTGREEN",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/LightGreen/NetworkCableLightGreenDot.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableDot_S.png",
                }
            }
        },
        LIGHTBLUE = {
            cable = {
                name = "RNS_NetworkCable_LIGHTBLUE",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/LightBlue/NetworkCableLightBlue.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/LightBlue/NetworkCableLightBluePlate.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableBlank_S.png",
            },
            underground = {
                name = "RNS_NetworkCableRamp_LIGHTBLUE",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/LightBlue/NetworkCableLightBlueRamp.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/LightBlue/NetworkCableLightBlueRamps.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableRampS.png",
            },
            sprites = {
                [1] = {
                    name = "RNS_NetworkCableNorth_LIGHTBLUE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/LightBlue/NetworkCableLightBlueN.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableN_S.png",
                },
                [2] = {
                    name = "RNS_NetworkCableEast_LIGHTBLUE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/LightBlue/NetworkCableLightBlueE.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableE_S.png",
                },
                [4] = {
                    name = "RNS_NetworkCableSouth_LIGHTBLUE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/LightBlue/NetworkCableLightBlueS.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableS_S.png",
                },
                [3] = {
                    name = "RNS_NetworkCableWest_LIGHTBLUE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/LightBlue/NetworkCableLightBlueW.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableW_S.png",
                },
                [5] = {
                    name = "RNS_NetworkCableDot_LIGHTBLUE",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/LightBlue/NetworkCableLightBlueDot.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableDot_S.png",
                }
            }
        },
        GREY = {
            cable = {
                name = "RNS_NetworkCable_GREY",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/Grey/NetworkCableGrey.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/Grey/NetworkCableGreyPlate.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableBlank_S.png",
            },
            underground = {
                name = "RNS_NetworkCableRamp_GREY",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/Grey/NetworkCableGreyRamp.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/Grey/NetworkCableGreyRamps.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableRampS.png",
            },
            sprites = {
                [1] = {
                    name = "RNS_NetworkCableNorth_GREY",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Grey/NetworkCableGreyN.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableN_S.png",
                },
                [2] = {
                    name = "RNS_NetworkCableEast_GREY",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Grey/NetworkCableGreyE.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableE_S.png",
                },
                [4] = {
                    name = "RNS_NetworkCableSouth_GREY",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Grey/NetworkCableGreyS.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableS_S.png",
                },
                [3] = {
                    name = "RNS_NetworkCableWest_GREY",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Grey/NetworkCableGreyW.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableW_S.png",
                },
                [5] = {
                    name = "RNS_NetworkCableDot_GREY",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Grey/NetworkCableGreyDot.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableDot_S.png",
                }
            }
        },
        GREEN = {
            cable = {
                name = "RNS_NetworkCable_GREEN",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/Green/NetworkCableGreen.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/Green/NetworkCableGreenPlate.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableBlank_S.png",
            },
            underground = {
                name = "RNS_NetworkCableRamp_GREEN",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/Green/NetworkCableGreenRamp.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/Green/NetworkCableGreenRamps.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableRampS.png",
            },
            sprites = {
                [1] = {
                    name = "RNS_NetworkCableNorth_GREEN",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Green/NetworkCableGreenN.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableN_S.png",
                },
                [2] = {
                    name = "RNS_NetworkCableEast_GREEN",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Green/NetworkCableGreenE.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableE_S.png",
                },
                [4] = {
                    name = "RNS_NetworkCableSouth_GREEN",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Green/NetworkCableGreenS.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableS_S.png",
                },
                [3] = {
                    name = "RNS_NetworkCableWest_GREEN",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Green/NetworkCableGreenW.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableW_S.png",
                },
                [5] = {
                    name = "RNS_NetworkCableDot_GREEN",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Green/NetworkCableGreenDot.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableDot_S.png",
                }
            }
        },
        BROWN = {
            cable = {
                name = "RNS_NetworkCable_BROWN",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/Brown/NetworkCableBrown.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/Brown/NetworkCableBrownPlate.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableBlank_S.png",
            },
            underground = {
                name = "RNS_NetworkCableRamp_BROWN",
                itemIcon = Constants.MOD_ID.."/graphics/Cables/Brown/NetworkCableBrownRamp.png",
                entityE =  Constants.MOD_ID.."/graphics/Cables/Brown/NetworkCableBrownRamps.png",
                entityS =  Constants.MOD_ID.."/graphics/Cables/NetworkCableRampS.png",
            },
            sprites = {
                [1] = {
                    name = "RNS_NetworkCableNorth_BROWN",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Brown/NetworkCableBrownN.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableN_S.png",
                },
                [2] = {
                    name = "RNS_NetworkCableEast_BROWN",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Brown/NetworkCableBrownE.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableE_S.png",
                },
                [4] = {
                    name = "RNS_NetworkCableSouth_BROWN",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Brown/NetworkCableBrownS.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableS_S.png",
                },
                [3] = {
                    name = "RNS_NetworkCableWest_BROWN",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Brown/NetworkCableBrownW.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableW_S.png",
                },
                [5] = {
                    name = "RNS_NetworkCableDot_BROWN",
                    sprite_E =  Constants.MOD_ID.."/graphics/Cables/Brown/NetworkCableBrownDot.png",
                    sprite_S =  Constants.MOD_ID.."/graphics/Cables/NetworkCableDot_S.png",
                }
            }
        },
    }
}
Constants.NetworkController = {
    main = {
        name = "RNS_NetworkController",
        itemIcon = Constants.MOD_ID.."/graphics/Networks/NetworkController/NetworkControllerI.png",
        entityE =  Constants.MOD_ID.."/graphics/Networks/NetworkController/NetworkControllerPlateE.png",
        entityS =  Constants.MOD_ID.."/graphics/Networks/NetworkController/NetworkControllerE_S2.png"
    },
    states = {
        stable = "RNS_NetworkController_Stable",
        unstable = "RNS_NetworkController_Unstable",
        itemIcon = Constants.MOD_ID.."/graphics/blank.png",
        stableE =  Constants.MOD_ID.."/graphics/Networks/NetworkController/NetworkControllerE_stable2.png",
        unstableE =  Constants.MOD_ID.."/graphics/Networks/NetworkController/NetworkControllerE_unstable2.png",
        shadow =  Constants.MOD_ID.."/graphics/Networks/NetworkController/NetworkControllerE_S2.png"
    }
}
Constants.NetworkTransReceiver = {
    transmitter = {
        name = "RNS_NetworkTransmitter",
        itemIcon = Constants.MOD_ID.."/graphics/Networks/TransReceiver/NetworkTransmitterI.png",
        entityE =  Constants.MOD_ID.."/graphics/Networks/TransReceiver/NetworkTransmitterE.png",
        entityS =  Constants.MOD_ID.."/graphics/Networks/TransReceiver/NetworkTransReceiverS.png",
    },
    receiver = {
        name = "RNS_NetworkReceiver",
        itemIcon = Constants.MOD_ID.."/graphics/Networks/TransReceiver/NetworkReceiverI.png",
        entityE =  Constants.MOD_ID.."/graphics/Networks/TransReceiver/NetworkReceiverE.png",
        entityS =  Constants.MOD_ID.."/graphics/Networks/TransReceiver/NetworkTransReceiverS.png"
    }
}
Constants.NetworkInventoryInterface = {
    name = "RNS_NetworkInventoryInterface",
    itemIcon = Constants.MOD_ID.."/graphics/Networks/NetworkInterface/NetworkInventoryBlockI.png",
    entityE =  Constants.MOD_ID.."/graphics/Networks/NetworkInterface/NetworkInventoryBlockE.png",
    entityS =  Constants.MOD_ID.."/graphics/Networks/NetworkInterface/NetworkInventoryBlockS.png"
}
Constants.WirelessGrid = {
    name = "RNS_PortableWirelessGrid",
    itemIcon = Constants.MOD_ID.."/graphics/Networks/Wireless/WirelessGridI.png",
    entityE =  Constants.MOD_ID.."/graphics/Networks/Wireless/WirelessGridE.png",
    entityS =  Constants.MOD_ID.."/graphics/Networks/Wireless/WirelessGridS.png",
}
Constants.Drives = {
    ItemDrive = {
        ItemDrive4k = {
            name = "RNS_ItemDrive4k",
            itemIcon = Constants.MOD_ID.."/graphics/Drives/ItemDrive1I.png",
            entityE =  Constants.MOD_ID.."/graphics/Drives/ItemDrive1E.png",
            entityS =  Constants.MOD_ID.."/graphics/Drives/DriveS.png",
            size = "4k",
            max_size = 4000,
            powerUsage = 40,
            subgroup = Constants.ItemGroup.Category.ItemDrive_subgroup,
            order = "i-i[1]"
        },
        ItemDrive16k = {
            name = "RNS_ItemDrive16k",
            itemIcon = Constants.MOD_ID.."/graphics/Drives/ItemDrive2I.png",
            entityE =  Constants.MOD_ID.."/graphics/Drives/ItemDrive2E.png",
            entityS =  Constants.MOD_ID.."/graphics/Drives/DriveS.png",
            size = "16k",
            max_size = 16000,
            powerUsage = 160,
            subgroup = Constants.ItemGroup.Category.ItemDrive_subgroup,
            order = "i-i[2]"
        },
        ItemDrive64k = {
            name = "RNS_ItemDrive64k",
            itemIcon = Constants.MOD_ID.."/graphics/Drives/ItemDrive3I.png",
            entityE =  Constants.MOD_ID.."/graphics/Drives/ItemDrive3E.png",
            entityS =  Constants.MOD_ID.."/graphics/Drives/DriveS.png",
            size = "64k",
            max_size = 64000,
            powerUsage = 640,
            subgroup = Constants.ItemGroup.Category.ItemDrive_subgroup,
            order = "i-i[3]"
        },
        ItemDrive256k = {
            name = "RNS_ItemDrive256k",
            itemIcon = Constants.MOD_ID.."/graphics/Drives/ItemDrive4I.png",
            entityE =  Constants.MOD_ID.."/graphics/Drives/ItemDrive4E.png",
            entityS =  Constants.MOD_ID.."/graphics/Drives/DriveS.png",
            size = "256k",
            max_size = 256000,
            powerUsage = 2560,
            subgroup = Constants.ItemGroup.Category.ItemDrive_subgroup,
            order = "i-i[4]"
        }
    },
    FluidDrive = {
        FluidDrive25k = {
            name = "RNS_FluidDrive25k",
            itemIcon = Constants.MOD_ID.."/graphics/Drives/FluidDrive1I.png",
            entityE =  Constants.MOD_ID.."/graphics/Drives/FluidDrive1E.png",
            entityS =  Constants.MOD_ID.."/graphics/Drives/DriveS.png",
            size = "25k",
            max_size = 25000,
            powerUsage = 40,
            subgroup = Constants.ItemGroup.Category.FluidDrive_subgroup,
            order = "f-f[1]"
        },
        FluidDrive100k = {
            name = "RNS_FluidDrive100k",
            itemIcon = Constants.MOD_ID.."/graphics/Drives/FluidDrive2I.png",
            entityE =  Constants.MOD_ID.."/graphics/Drives/FluidDrive2E.png",
            entityS =  Constants.MOD_ID.."/graphics/Drives/DriveS.png",
            size = "100k",
            max_size = 100000,
            powerUsage = 160,
            subgroup = Constants.ItemGroup.Category.FluidDrive_subgroup,
            order = "f-f[2]"
        },
        FluidDrive400k = {
            name = "RNS_FluidDrive400k",
            itemIcon = Constants.MOD_ID.."/graphics/Drives/FluidDrive3I.png",
            entityE =  Constants.MOD_ID.."/graphics/Drives/FluidDrive3E.png",
            entityS =  Constants.MOD_ID.."/graphics/Drives/DriveS.png",
            size = "400k",
            max_size = 400000,
            powerUsage = 640,
            subgroup = Constants.ItemGroup.Category.FluidDrive_subgroup,
            order = "f-f[3]"
        },
        FluidDrive1600k = {
            name = "RNS_FluidDrive1600k",
            itemIcon = Constants.MOD_ID.."/graphics/Drives/FluidDrive4I.png",
            entityE =  Constants.MOD_ID.."/graphics/Drives/FluidDrive4E.png",
            entityS =  Constants.MOD_ID.."/graphics/Drives/DriveS.png",
            size = "1600k",
            max_size = 1600000,
            powerUsage = 2560,
            subgroup = Constants.ItemGroup.Category.FluidDrive_subgroup,
            order = "f-f[4]"
        }
    }
}
Constants.Recipies = {
    SiliconWafer = {
        name = Constants.Intermediates.SiliconWafer.name,
        craft_time = 1,
        enabled = false,
        category = "crafting",
        ingredients = {{"stone", 15}},
        count = 3
    },
    CalculatorProcessor = {
        name = Constants.Intermediates.CalculatorProcessor.name,
        craft_time = 0.5,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"electronic-circuit", 1},
            {Constants.Intermediates.SiliconWafer.name, 1},
            --{"copper-cable", 3},
            {"arithmetic-combinator", 1},
        },
        count = 1
    },
    LogicProcessor = {
        name = Constants.Intermediates.LogicProcessor.name,
        craft_time = 0.5,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"advanced-circuit", 1},
            {Constants.Intermediates.SiliconWafer.name, 1},
            --{"copper-cable", 3},
            {"decider-combinator", 1},
        },
        count = 1
    },
    EngineeringProcessor = {
        name = Constants.Intermediates.EngineeringProcessor.name,
        craft_time = 0.5,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"processing-unit", 1},
            {Constants.Intermediates.SiliconWafer.name, 1},
            --{"copper-cable", 3},
            {"arithmetic-combinator", 1},
            {"decider-combinator", 1},
        },
        count = 1
    },
    NetworkController = {
        name = Constants.NetworkController.main.name,
        craft_time = 5,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"electronic-circuit", 10},
            {"assembling-machine-2", 1},
            {Constants.Intermediates.CalculatorProcessor.name, 5},
            {Constants.Intermediates.LogicProcessor.name, 5},
            {"radar", 1},
        },
        count = 1
    },
    NetworkInventoryInterface = {
        name = Constants.NetworkInventoryInterface.name,
        craft_time = 5,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"electronic-circuit", 10},
            {"copper-cable", 5},
            {"copper-plate", 5},
            {Constants.Intermediates.CalculatorProcessor.name, 2},
            {Constants.Intermediates.LogicProcessor.name, 2},
            {"iron-plate", 10},
            {"small-lamp", 15},
        },
        count = 1
    },
    WirelessGrid = {
        name = Constants.WirelessGrid.name,
        craft_time = 5,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"battery", 20},
            {"low-density-structure", 5},
            {"radar", 2},
            {Constants.NetworkInventoryInterface.name, 1},
            {Constants.Intermediates.EngineeringProcessor.name, 2},
            {"solar-panel", 10},
        },
        count = 1
    },
    NetworkTransmitter = {
        name = Constants.NetworkTransReceiver.transmitter.name,
        craft_time = 10,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"satellite", 1},
            {"logistic-chest-requester", 1},
            {"radar", 2},
            {Constants.Intermediates.EngineeringProcessor.name, 4},
        },
        count = 1
    },
    NetworkReceiver = {
        name = Constants.NetworkTransReceiver.receiver.name,
        craft_time = 10,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"satellite", 1},
            {"logistic-chest-active-provider", 1},
            {"radar", 2},
            {Constants.Intermediates.EngineeringProcessor.name, 4},
        },
        count = 1
    },
    WirelessTransmitter = {
        name = Constants.NetworkCables.wirelessTransmitter.name,
        craft_time = 8,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"radar", 2},
            {"substation", 4},
            {"big-electric-pole", 1},
            --{"copper-cable", 50},
            {Constants.Intermediates.EngineeringProcessor.name, 4},
        },
        count = 1
    },
    PlayerPort = {
        name = Constants.PlayerPort.name,
        craft_time = 8,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"logistic-chest-requester", 1},
            {"logistic-chest-active-provider", 1},
            {"personal-roboport-mk2-equipment", 1},
            {Constants.Intermediates.EngineeringProcessor.name, 1},
            {Constants.Intermediates.LogicProcessor.name, 3},
            {Constants.Intermediates.CalculatorProcessor.name, 2},
        },
        count = 1
    },
    Detector = {
        name = Constants.Detector.name,
        craft_time = 1,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"copper-cable", 6},
            --{"plastic-bar", 6},
            {"decider-combinator", 1},
            {Constants.NetworkCables.Cables.RED.cable.name, 2},
            {Constants.Intermediates.LogicProcessor.name, 4},
        },
        count = 1
    },
    RED_Cable = {
        name = Constants.NetworkCables.Cables.RED.cable.name,
        craft_time = 0.5,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"copper-cable", 10},
            {"electronic-circuit", 5},
            {"iron-plate", 5},
        },
        count = 10
    },
    ItemIO = {
        name = Constants.NetworkCables.itemIO.name,
        craft_time = 2,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"fast-inserter", 10},
            {"engine-unit", 5},
            {Constants.NetworkCables.Cables.RED.cable.name, 2},
            {Constants.Intermediates.CalculatorProcessor.name, 1},
            {Constants.Intermediates.LogicProcessor.name, 1},
        },
        count = 1
    },
    FluidIO = {
        name = Constants.NetworkCables.fluidIO.name,
        craft_time = 2,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"pump", 10},
            {"engine-unit", 5},
            {Constants.NetworkCables.Cables.RED.cable.name, 2},
            {Constants.Intermediates.CalculatorProcessor.name, 1},
            {Constants.Intermediates.LogicProcessor.name, 1},
        },
        count = 1
    },
    ExternalIO = {
        name = Constants.NetworkCables.externalIO.name,
        craft_time = 2,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"pump", 5},
            {"fast-inserter", 5},
            {"engine-unit", 5},
            {Constants.NetworkCables.Cables.RED.cable.name, 2},
            {Constants.Intermediates.CalculatorProcessor.name, 1},
            {Constants.Intermediates.LogicProcessor.name, 1},
        },
        count = 1
    },
    ItemDrive4k = {
        name = Constants.Drives.ItemDrive.ItemDrive4k.name,
        craft_time = 1,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"electronic-circuit", 8},
            {"copper-cable", 4},
            {"steel-chest", 1},
            {"iron-plate", 6}
        },
        count = 1
    },
    ItemDrive16k = {
        name = Constants.Drives.ItemDrive.ItemDrive16k.name,
        craft_time = 5,
        enabled = false,
        category = "crafting",
        ingredients = {
            {Constants.Drives.ItemDrive.ItemDrive4k.name, 3},
            {"copper-cable", 4},
            {Constants.Intermediates.CalculatorProcessor.name, 4},
            {"steel-plate", 2}
        },
        count = 1
    },
    ItemDrive64k = {
        name = Constants.Drives.ItemDrive.ItemDrive64k.name,
        craft_time = 10,
        enabled = false,
        category = "crafting",
        ingredients = {
            {Constants.Drives.ItemDrive.ItemDrive16k.name, 3},
            {Constants.Intermediates.LogicProcessor.name, 4},
            {"plastic-bar", 4},
            {"steel-plate", 2}
        },
        count = 1
    },
    ItemDrive256k = {
        name = Constants.Drives.ItemDrive.ItemDrive256k.name,
        craft_time = 15,
        enabled = false,
        category = "crafting",
        ingredients = {
            {Constants.Drives.ItemDrive.ItemDrive64k.name, 3},
            {Constants.Intermediates.EngineeringProcessor.name, 4},
            {"low-density-structure", 4},
            {"steel-plate", 2}
        },
        count = 1
    },
    FluidDrive25k = {
        name = Constants.Drives.FluidDrive.FluidDrive25k.name,
        craft_time = 1,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"electronic-circuit", 8},
            {"copper-cable", 4},
            {"storage-tank", 1},
            {"iron-plate", 6}
        },
        count = 1
    },
    FluidDrive100k = {
        name = Constants.Drives.FluidDrive.FluidDrive100k.name,
        craft_time = 5,
        enabled = false,
        category = "crafting",
        ingredients = {
            {Constants.Drives.FluidDrive.FluidDrive25k.name, 3},
            {"copper-cable", 4},
            {Constants.Intermediates.CalculatorProcessor.name, 4},
            {"empty-barrel", 2}
        },
        count = 1
    },
    FluidDrive400k = {
        name = Constants.Drives.FluidDrive.FluidDrive400k.name,
        craft_time = 10,
        enabled = false,
        category = "crafting",
        ingredients = {
            {Constants.Drives.FluidDrive.FluidDrive100k.name, 3},
            {Constants.Intermediates.LogicProcessor.name, 4},
            {"plastic-bar", 4},
            {"empty-barrel", 2}
        },
        count = 1
    },
    FluidDrive1600k = {
        name = Constants.Drives.FluidDrive.FluidDrive1600k.name,
        craft_time = 15,
        enabled = false,
        category = "crafting",
        ingredients = {
            {Constants.Drives.FluidDrive.FluidDrive400k.name, 3},
            {Constants.Intermediates.EngineeringProcessor.name, 4},
            {"low-density-structure", 4},
            {"empty-barrel", 2}
        },
        count = 1
    }
}
for color, cables in pairs(Constants.NetworkCables.Cables) do
    Constants.Recipies[color.."_Underground"] = {
        name = cables.underground.name,
        craft_time = 2,
        enabled = false,
        category = "crafting",
        ingredients = {
            {"copper-cable", 2},
            {"iron-plate", 5},
            {cables.cable.name, 2},
        },
        count = 2
    }
    if color == "RED" then goto continue end
    Constants.Recipies[color.."_Cable"] = {
        name = cables.cable.name,
        craft_time = 0.1,
        enabled = false,
        category = "crafting",
        ingredients = {
            {Constants.NetworkCables.Cables.RED.cable.name, 10},
        },
        count = 10
    }
    ::continue::
end
Constants.Technologies = {
    AdvancedStorageHandling = {
        name = "RNS-advanced-storage-handling",
        icon = Constants.MOD_ID .. "/graphics/Networks/NetworkController/NetworkControllerI.png",
        icon_size = 256,
        prerequisites = {
            "circuit-network",
            "optics",
            "fast-inserter",
            "fluid-handling"
        },
        effects = {
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.NetworkController.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.ItemDrive4k.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.FluidDrive25k.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.ExternalIO.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.ItemIO.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.FluidIO.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.NetworkInventoryInterface.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.SiliconWafer.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.CalculatorProcessor.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.LogicProcessor.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.RED_Cable.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.WHITE_Cable.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.PURPLE_Cable.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.PINK_Cable.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.ORANGE_Cable.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.LIGHTGREEN_Cable.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.LIGHTBLUE_Cable.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.GREY_Cable.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.GREEN_Cable.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.BROWN_Cable.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.RED_Underground.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.WHITE_Underground.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.PURPLE_Underground.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.PINK_Underground.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.ORANGE_Underground.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.LIGHTGREEN_Underground.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.LIGHTBLUE_Underground.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.GREY_Underground.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.GREEN_Underground.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.BROWN_Underground.name
            },
        },
        upgrade = false,
        max_level = 1,
        unit = {
            count = 150,
            time = 45,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            }
        }
    },
    CircuitHandling = {
        name = "RNS-circuit-handling",
        icon = Constants.MOD_ID .. "/graphics/Networks/Detector/DetectorI.png",
        prerequisites = {
            "RNS-advanced-storage-handling",
            "circuit-network",
            "advanced-electronics",
        },
        effects = {
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.Detector.name
            }
        },
        max_level = 1,
        upgrade = false,
        unit = {
            count = 75,
            time = 15,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
            }
        }
    },
    EngineeringProcessor = {
        name = "RNS-engineering-processor",
        icon = Constants.MOD_ID .. "/graphics/engineering_processor.png",
        prerequisites = {
            "RNS-advanced-storage-handling",
            "advanced-electronics-2",
        },
        effects = {
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.EngineeringProcessor.name
            },
        },
        max_level = 1,
        upgrade = false,
        unit = {
            count = 300,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}
            }
        }
    },
    WirelessInteraction = {
        name = "RNS-wireless-interaction",
        icon = Constants.MOD_ID .. "/graphics/Networks/Wireless/WirelessGridI.png",
        prerequisites = {
            "RNS-engineering-processor",
            "electric-energy-distribution-2",
            "battery",
            "low-density-structure",
            "solar-energy"
        },
        effects = {
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.WirelessTransmitter.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.WirelessGrid.name
            },
        },
        max_level = 1,
        upgrade = false,
        unit = {
            count = 275,
            time = 45,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1}
            }
        }
    },
    PersonalLogistics = {
        name = "RNS-personal-logistics",
        icon = Constants.MOD_ID .. "/graphics/personalPlayerPort.png",
        icon_size = 256,
        prerequisites = {
            "RNS-wireless-interaction",
            "logistic-system",
            "personal-roboport-mk2-equipment",
        },
        effects = {
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.PlayerPort.name
            },
        },
        max_level = 1,
        upgrade = false,
        unit = {
            count = 325,
            time = 45,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"utility-science-pack", 1}
            }
        }
    },
    LongDistanceConnections = {
        name = "RNS-long-distance-connections",
        icon = Constants.MOD_ID .. "/graphics/Networks/TransReceiver/NetworkTransmitterI.png",
        prerequisites = {
            "RNS-advanced-storage-handling",
            "RNS-engineering-processor",
            "space-science-pack",
        },
        effects = {
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.NetworkTransmitter.name
            },
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.NetworkReceiver.name
            },
        },
        max_level = 1,
        upgrade = false,
        unit = {
            count = 2000,
            time = 60,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"utility-science-pack", 1},
                {"production-science-pack", 1},
                {"space-science-pack", 1}
            }
        }
    },
    ItemDrive1 = {
        name = "RNS-itemdrive-1",
        icon = Constants.MOD_ID .. "/graphics/Drives/ItemDrive2I.png",
        prerequisites = {
            "RNS-advanced-storage-handling",
        },
        effects = {
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.ItemDrive16k.name
            },
        },
        upgrade = true,
        max_level = 1,
        unit = {
            count = 200,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
            }
        }
    },
    ItemDrive2 = {
        name = "RNS-itemdrive-2",
        icon = Constants.MOD_ID .. "/graphics/Drives/ItemDrive3I.png",
        prerequisites = {
            "RNS-itemdrive-1",
        },
        effects = {
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.ItemDrive64k.name
            },
        },
        upgrade = true,
        max_level = 2,
        unit = {
            count = 250,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
            }
        }
    },
    ItemDrive3 = {
        name = "RNS-itemdrive-3",
        icon = Constants.MOD_ID .. "/graphics/Drives/ItemDrive4I.png",
        prerequisites = {
            "RNS-itemdrive-2",
        },
        effects = {
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.ItemDrive256k.name
            },
        },
        upgrade = true,
        max_level = 3,
        unit = {
            count =300,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"utility-science-pack", 1},
                {"production-science-pack", 1},
            }
        }
    },
    FluidDrive1 = {
        name = "RNS-fluiddrive-1",
        icon = Constants.MOD_ID .. "/graphics/Drives/FluidDrive2I.png",
        prerequisites = {
            "RNS-advanced-storage-handling",
        },
        effects = {
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.FluidDrive100k.name
            },
        },
        upgrade = true,
        max_level = 1,
        unit = {
            count = 300,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
            }
        }
    },
    FluidDrive2 = {
        name = "RNS-fluiddrive-2",
        icon = Constants.MOD_ID .. "/graphics/Drives/FluidDrive3I.png",
        prerequisites = {
            "RNS-fluiddrive-1",
        },
        effects = {
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.FluidDrive400k.name
            },
        },
        upgrade = true,
        max_level = 2,
        unit = {
            count = 250,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
            }
        }
    },
    FluidDrive3 = {
        name = "RNS-fluiddrive-3",
        icon = Constants.MOD_ID .. "/graphics/Drives/FluidDrive4I.png",
        prerequisites = {
            "RNS-fluiddrive-2",
        },
        effects = {
            {
                type  = "unlock-recipe",
                recipe = Constants.Recipies.FluidDrive1600k.name
            },
        },
        upgrade = true,
        max_level = 3,
        unit = {
            count = 300,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"utility-science-pack", 1},
                {"production-science-pack", 1},
            }
        }
    },
    ItemTransferBonus1 = {
        name = "RNS-item-transfer-bonus-1",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/ItemIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-advanced-storage-handling",
        },
        effects = {},
        upgrade = true,
        max_level = 1,
        unit = {
            count = 200,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
            }
        }
    },
    ItemTransferBonus2 = {
        name = "RNS-item-transfer-bonus-2",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/ItemIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-item-transfer-bonus-1",
        },
        effects = {},
        upgrade = true,
        max_level = 2,
        unit = {
            count = 300,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
            }
        }
    },
    ItemTransferBonus3 = {
        name = "RNS-item-transfer-bonus-3",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/ItemIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-item-transfer-bonus-2",
        },
        effects = {},
        upgrade = true,
        max_level = 3,
        unit = {
            count = 400,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
            }
        }
    },
    ItemTransferBonus4 = {
        name = "RNS-item-transfer-bonus-4",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/ItemIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-item-transfer-bonus-3",
        },
        effects = {},
        upgrade = true,
        max_level = 4,
        unit = {
            count = 500,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
            }
        }
    },
    ItemTransferBonus5 = {
        name = "RNS-item-transfer-bonus-5",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/ItemIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-item-transfer-bonus-4",
        },
        effects = {},
        upgrade = true,
        max_level = 5,
        unit = {
            count = 600,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
            }
        }
    },
    ItemTransferBonus6 = {
        name = "RNS-item-transfer-bonus-6",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/ItemIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-item-transfer-bonus-5",
        },
        effects = {},
        upgrade = true,
        max_level = 6,
        unit = {
            count = 700,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
            }
        }
    },
    ItemTransferBonus7 = {
        name = "RNS-item-transfer-bonus-7",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/ItemIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-item-transfer-bonus-6",
        },
        effects = {},
        upgrade = true,
        max_level = 7,
        unit = {
            count = 800,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
            }
        }
    },
    ItemTransferBonus8 = {
        name = "RNS-item-transfer-bonus-8",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/ItemIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-item-transfer-bonus-7",
        },
        effects = {},
        upgrade = true,
        max_level = 8,
        unit = {
            count = 900,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
            }
        }
    },
    ItemTransferBonusInfinite = {
        name = "RNS-item-transfer-bonus-infinite",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/ItemIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-item-transfer-bonus-8",
        },
        effects = {},
        upgrade = true,
        max_level = "infinite",
        unit = {
            count_formula = "(2^L)*1000",
            time = 60,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
                {"space-science-pack", 1},
            }
        }
    },
    FluidTransferBonus1 = {
        name = "RNS-fluid-transfer-bonus-1",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/FluidIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-advanced-storage-handling",
        },
        effects = {},
        upgrade = true,
        max_level = 1,
        unit = {
            count = 200,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
            }
        }
    },
    FluidTransferBonus2 = {
        name = "RNS-fluid-transfer-bonus-2",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/FluidIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-fluid-transfer-bonus-1",
        },
        effects = {},
        upgrade = true,
        max_level = 2,
        unit = {
            count = 300,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
            }
        }
    },
    FluidTransferBonus3 = {
        name = "RNS-fluid-transfer-bonus-3",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/FluidIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-fluid-transfer-bonus-2",
        },
        effects = {},
        upgrade = true,
        max_level = 3,
        unit = {
            count = 400,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
            }
        }
    },
    FluidTransferBonus4 = {
        name = "RNS-fluid-transfer-bonus-4",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/FluidIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-fluid-transfer-bonus-3",
        },
        effects = {},
        upgrade = true,
        max_level = 4,
        unit = {
            count = 500,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
            }
        }
    },
    FluidTransferBonus5 = {
        name = "RNS-fluid-transfer-bonus-5",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/FluidIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-fluid-transfer-bonus-4",
        },
        effects = {},
        upgrade = true,
        max_level = 5,
        unit = {
            count = 600,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
            }
        }
    },
    FluidTransferBonus6 = {
        name = "RNS-fluid-transfer-bonus-6",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/FluidIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-fluid-transfer-bonus-5",
        },
        effects = {},
        upgrade = true,
        max_level = 6,
        unit = {
            count = 700,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
            }
        }
    },
    FluidTransferBonus7 = {
        name = "RNS-fluid-transfer-bonus-7",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/FluidIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-fluid-transfer-bonus-6",
        },
        effects = {},
        upgrade = true,
        max_level = 7,
        unit = {
            count = 800,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
            }
        }
    },
    FluidTransferBonus8 = {
        name = "RNS-fluid-transfer-bonus-8",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/FluidIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-fluid-transfer-bonus-7",
        },
        effects = {},
        upgrade = true,
        max_level = 8,
        unit = {
            count = 900,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
            }
        }
    },
    FluidTransferBonusInfinite = {
        name = "RNS-fluid-transfer-bonus-infinite",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Cables/IO/FluidIO.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-fluid-transfer-bonus-8",
        },
        effects = {},
        upgrade = true,
        max_level = "infinite",
        unit = {
            count_formula = "(2^L)*1000",
            time = 60,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
                {"space-science-pack", 1},
            }
        }
    },
    WirelessRangeBonus1 = {
        name = "RNS-wireless-range-bonus-1",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Networks/Wireless/WirelessTransmitterI.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-advanced-storage-handling",
        },
        effects = {},
        upgrade = true,
        max_level = 1,
        unit = {
            count = 400,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
            }
        }
    },
    WirelessRangeBonus2 = {
        name = "RNS-wireless-range-bonus-2",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Networks/Wireless/WirelessTransmitterI.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-wireless-range-bonus-1",
        },
        effects = {},
        upgrade = true,
        max_level = 2,
        unit = {
            count = 600,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
            }
        }
    },
    WirelessRangeBonus3 = {
        name = "RNS-wireless-range-bonus-3",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Networks/Wireless/WirelessTransmitterI.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-wireless-range-bonus-2",
        },
        effects = {},
        upgrade = true,
        max_level = 3,
        unit = {
            count = 800,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
            }
        }
    },
    WirelessRangeBonus4 = {
        name = "RNS-wireless-range-bonus-4",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Networks/Wireless/WirelessTransmitterI.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-wireless-range-bonus-3",
        },
        effects = {},
        upgrade = true,
        max_level = 4,
        unit = {
            count = 1200,
            time = 30,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
            }
        }
    },
    WirelessRangeBonusInf = {
        name = "RNS-wireless-range-bonus-inf",
        icons = {
            {
                icon = Constants.MOD_ID .. "/graphics/Networks/Wireless/WirelessTransmitterI.png",
            },
            {
                icon = Constants.MOD_ID .. "/graphics/upgrade_icon.png",
            }
        },
        prerequisites = {
            "RNS-wireless-range-bonus-4",
        },
        effects = {},
        upgrade = true,
        max_level = 1,
        unit = {
            count = 4000,
            time = 60,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
                {"space-science-pack", 1},
            }
        }
    },
}
return Constants