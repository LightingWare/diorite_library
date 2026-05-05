local ReplicatedStorage = game:GetService("ReplicatedStorage")

assert(ReplicatedStorage.diorite_SS_SHARED, "Shared module not found.")

local Shared = ReplicatedStorage.diorite_SS_SHARED

if Shared then
    require(Shared)
    Shared.ssinit:FireServer()
end
