-- Acessando os serviços necessários
local players = game:GetService("Players")
local player = players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local runService = game:GetService("RunService")

-- Obtendo referência ao Cloning e seus componentes
local cloningFrame = playerGui:WaitForChild("CloningSystem"):WaitForChild("Cloning")
local craftFrame = cloningFrame:WaitForChild("CraftFrame")
local craftButton = craftFrame:WaitForChild("Craft")

-- Variável para controlar a visibilidade
local isCloningFrameVisible = true

-- Função para esconder o frame Cloning
local function hideCloningFrame()
    isCloningFrameVisible = false
    cloningFrame.Visible = false
end

-- Função para tornar o frame Cloning visível novamente
local function showCloningFrame()
    isCloningFrameVisible = true
    cloningFrame.Visible = true
    craftFrame.Visible = true
    craftButton.Visible = true
end

-- Monitorar visibilidade continuamente e reativar se for alterada
runService.RenderStepped:Connect(function()
    if isCloningFrameVisible then
        if not cloningFrame.Visible then cloningFrame.Visible = true end
        if not craftFrame.Visible then craftFrame.Visible = true end
        if not craftButton.Visible then craftButton.Visible = true end
    end
end)

-- Removendo o botão "Close" se existir
local closeButton = cloningFrame:FindFirstChild("Close")
if closeButton then
    closeButton:Destroy()
end

-- Criando o botão "Return"
local returnButton = Instance.new("TextButton")
returnButton.Name = "Return"
returnButton.Parent = cloningFrame
returnButton.Size = UDim2.new(0.3, 0, 0.08, 0) -- Tamanho proporcional
returnButton.Position = UDim2.new(0.35, 0, 0.02, 0) -- Centralizado no topo
returnButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
returnButton.BorderSizePixel = 0
returnButton.Text = "Return"
returnButton.Font = Enum.Font.GothamBold
returnButton.TextSize = 20
returnButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Criando um efeito de gradiente moderno
local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), -- Azul neon
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 150))  -- Verde neon
}
uiGradient.Rotation = 90
uiGradient.Parent = returnButton

-- Conectar a função ao clique do botão Return
returnButton.MouseButton1Click:Connect(function()
    hideCloningFrame()
    
    -- Verificar se o CoreGui tem o "InfinityHub" e ativar o Frame
    local coreGui = game:GetService("CoreGui")
    local infinityHubScreenGui = coreGui:FindFirstChild("InfinityHub")
    
    if infinityHubScreenGui then
        local infinityHubFrame = infinityHubScreenGui:FindFirstChildOfClass("Frame")
        if infinityHubFrame then
            infinityHubFrame.Visible = true
        end

        -- Se existir um botão dentro do InfinityHub, tornar visível
        local textButton = infinityHubScreenGui:FindFirstChild("TextButton")
        if textButton then
            textButton.Visible = true
        end
    end
end)

-- **Garante que o frame apareça quando o código for executado**
showCloningFrame()
