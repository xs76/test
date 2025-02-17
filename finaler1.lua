

local Players = game:GetService("Players")

-- Customize these with your own usernames and developers
local usernameColors = {
    ["XxxS_omeonexxX"] = Color3.fromHex("#f48fff"),
    ["Dextacular"] = Color3.fromHex("#f48fff"),
    ["yarhmplus"] = Color3.fromHex("#f48fff"),
    ["joystick531"] = Color3.fromHex("#ff0000"),
    ["givepetroblox"] = Color3.fromHex("#ff0000"),
    ["Bubberbolf"] = Color3.fromHex("#0030ff"),
}

local specialUsernameColors = {
    ["heyprestonitsme"] = Color3.fromHex("#ffac33"),
    ["vuralnovada"] = Color3.fromHex("#ffac33"),
    ["Doge3071"] = Color3.fromHex("#ffac33"),
    ["jacobisawsome307"] = Color3.fromHex("#ffac33"),
    ["fweemeimtrapwed"] = Color3.fromHex("#ffac33"),
}

local knowledgeableUsernameColors = {
    ["mrghostmr184"] = Color3.fromHex("#bf40bf"),
    ["God_Hood07"] = Color3.fromHex("#bf40bf"),
}

local mainText = "YARHM Developer"
local mainFont = Enum.Font.GothamBold
local specialText = "YARHM+"
local specialFont = Enum.Font.GothamBold
local knowledgeableText = "somewhat knowledgeable yarhm user"
local knowledgeableFont = Enum.Font.GothamBold

local function createTextLabel(player, text, color)
    local head = player.Character and player.Character:FindFirstChild("Head")
    if head then
        -- Remove any existing tags to avoid duplicates
        local existingTag = head:FindFirstChild("DeveloperTag") or head:FindFirstChild("SpecialTag") or head:FindFirstChild("KnowledgeableTag")
        if existingTag then
            existingTag:Destroy()
        end

        local mainTextLabel = Instance.new("BillboardGui")
        mainTextLabel.Parent = tagsFolder
        mainTextLabel.Name = text == mainText and "DeveloperTag" or text == specialText and "SpecialTag" or "KnowledgeableTag"
        mainTextLabel.Size = UDim2.new(5, 0, 1, 0)
        mainTextLabel.StudsOffset = Vector3.new(0, 2, 0)
        mainTextLabel.Adornee = head
        mainTextLabel.AlwaysOnTop = false
        mainTextLabel.MaxDistance = math.huge
        mainTextLabel.LightInfluence = 0
        if player.Name == "joystick531" then
            mainTextLabel.Brightness = 5
        end

        local mainTextElement = Instance.new("TextLabel")
        mainTextElement.Size = UDim2.new(1, 0, 1, 0)
        mainTextElement.Text = text
        mainTextElement.TextColor3 = color
        mainTextElement.BackgroundTransparency = 1
        mainTextElement.Font = mainFont
        if text == specialText then
            mainTextElement.Font = specialFont
        elseif text == knowledgeableText then
            mainTextElement.Font = knowledgeableFont
        end
        mainTextElement.TextScaled = true
        mainTextElement.Parent = mainTextLabel
    end
end

local function checkForPlayer(player)
    if usernameColors[player.Name] then
        createTextLabel(player, mainText, usernameColors[player.Name])
    elseif specialUsernameColors[player.Name] then
        createTextLabel(player, specialText, specialUsernameColors[player.Name])
    elseif knowledgeableUsernameColors[player.Name] then
        createTextLabel(player, knowledgeableText, knowledgeableUsernameColors[player.Name])
    end
end

local function onCharacterAdded(player)
    player.CharacterAdded:Connect(function(character)
        -- Wait for 10 seconds before reapplying the tag
        task.wait(10)
        checkForPlayer(player)
    end)
end

local function handlePlayer(player)
    checkForPlayer(player)
    onCharacterAdded(player)
end

for _, player in ipairs(Players:GetPlayers()) do
    handlePlayer(player)
end

Players.PlayerAdded:Connect(handlePlayer)

