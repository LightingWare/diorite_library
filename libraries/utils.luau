local _UserInputService = game:GetService("UserInputService")
local _RunService = game:GetService("RunService")
local _Players = game:GetService("Players")

if not _RunService:IsClient() then
    warn("This library is client-sided and should not be used on the server.")
end

local lib = {}

local _plr = _Players.LocalPlayer

function lib:Dragify(guiObject)
    local dragging = false
    local dragInput, mousePos, framePos

    guiObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = guiObject.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    guiObject.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    _UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            guiObject.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
end

function lib:GetEnvironment()
    local get = "Unknown"

    if _RunService then
        if _RunService:IsStudio() then
            get = "Studio"
        else
            if identifyexecutor and identifyexecutor() then
                get = identifyexecutor()
            end
        end
    end
    
    return get
end

return lib
