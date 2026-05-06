local ReplicatedStorage = game:GetService("ReplicatedStorage")

assert(ReplicatedStorage:FindFirstChild("diorite_SS_SHARED", true), "Shared Library not found!")

if ReplicatedStorage.diorite_SS_SHARED then
    ReplicatedStorage.diorite_SS_SHARED.ssinit:FireServer() -- ReplicatedStorage.diorite_SS_SHARED.ssinit:FireServer()
end
