-- Acessando os serviços necessários
local players = game:GetService("Players")
local player = players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Obtendo referência ao frame Cloning
local cloningFrame = playerGui:WaitForChild("CloningSystem"):WaitForChild("Cloning")

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

-- Função para desativar todas as GUIs e parar tudo
local function disableAllGUIs()
    for _, gui in pairs(playerGui:GetChildren()) do
        if gui:IsA("ScreenGui") then
            gui.Enabled = false
        end
    end
    -- Opcional: Parar o jogo ou scripts relacionados
    script.Disabled = true
end

-- Conectar a função ao clique do botão
returnButton.MouseButton1Click:Connect(disableAllGUIs)
