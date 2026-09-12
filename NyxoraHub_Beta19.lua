
--============================================================--
--                    NYXORA HUB
--                      BETA 1.9
--                   STABLE BASE BUILD
--============================================================--

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--============================================================--
-- CLEAN
--============================================================--

local Old = PlayerGui:FindFirstChild("NyxoraHub_Beta19")

if Old then
    Old:Destroy()
end

--============================================================--
-- SETTINGS
--============================================================--

local WIDTH = 450
local HEIGHT = 290

local BG = Color3.fromRGB(9, 9, 11)
local PANEL = Color3.fromRGB(15, 15, 18)
local CARD = Color3.fromRGB(22, 22, 26)
local HOVER = Color3.fromRGB(31, 31, 36)
local TEXT = Color3.fromRGB(242, 242, 245)
local MUTED = Color3.fromRGB(132, 132, 141)
local ORANGE = Color3.fromRGB(235, 116, 38)
local BORDER = Color3.fromRGB(39, 39, 46)

--============================================================--
-- UTILITIES
--============================================================--

local function tween(object, duration, properties, style, direction)
    local info = TweenInfo.new(
        duration,
        style or Enum.EasingStyle.Quart,
        direction or Enum.EasingDirection.Out
    )

    local animation = TweenService:Create(
        object,
        info,
        properties
    )

    animation:Play()

    return animation
end

local function corner(object, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = object

    return c
end

local function stroke(object, transparency, thickness)
    local s = Instance.new("UIStroke")
    s.Color = BORDER
    s.Thickness = thickness or 1
    s.Transparency = transparency or 0.25
    s.Parent = object

    return s
end

--============================================================--
-- GUI
--============================================================--

local Gui = Instance.new("ScreenGui")

Gui.Name = "NyxoraHub_Beta19"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.DisplayOrder = 999
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = PlayerGui

--============================================================--
-- MAIN
--============================================================--

local Main = Instance.new("Frame")

Main.Name = "Main"
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.fromScale(0.5, 0.5)
Main.Size = UDim2.fromOffset(WIDTH, HEIGHT)
Main.BackgroundColor3 = BG
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = Gui

corner(Main, 10)
stroke(Main, 0.15, 1)

--============================================================--
-- TOP BAR
--============================================================--

local Top = Instance.new("Frame")

Top.Name = "TopBar"
Top.Size = UDim2.new(1, 0, 0, 44)
Top.BackgroundColor3 = PANEL
Top.BorderSizePixel = 0
Top.Parent = Main

local TopLine = Instance.new("Frame")

TopLine.Name = "TopLine"
TopLine.Position = UDim2.new(0, 0, 1, -1)
TopLine.Size = UDim2.new(1, 0, 0, 1)
TopLine.BackgroundColor3 = BORDER
TopLine.BackgroundTransparency = 0.35
TopLine.BorderSizePixel = 0
TopLine.Parent = Top

local Accent = Instance.new("Frame")

Accent.Name = "Accent"
Accent.Position = UDim2.fromOffset(15, 0)
Accent.Size = UDim2.fromOffset(42, 2)
Accent.BackgroundColor3 = ORANGE
Accent.BorderSizePixel = 0
Accent.Parent = Top

corner(Accent, 2)

local AccentGlow = Instance.new("Frame")

AccentGlow.Name = "AccentGlow"
AccentGlow.Position = UDim2.fromOffset(15, 2)
AccentGlow.Size = UDim2.fromOffset(42, 1)
AccentGlow.BackgroundColor3 = ORANGE
AccentGlow.BackgroundTransparency = 0.65
AccentGlow.BorderSizePixel = 0
AccentGlow.Parent = Top

local Title = Instance.new("TextLabel")

Title.Name = "Title"
Title.Position = UDim2.fromOffset(15, 7)
Title.Size = UDim2.fromOffset(150, 17)
Title.BackgroundTransparency = 1
Title.Text = "NYXORA"
Title.TextColor3 = TEXT
Title.TextSize = 13
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Top

local Version = Instance.new("TextLabel")

Version.Name = "Version"
Version.Position = UDim2.fromOffset(16, 25)
Version.Size = UDim2.fromOffset(170, 10)
Version.BackgroundTransparency = 1
Version.Text = "BETA 1.9  /  STABLE BUILD"
Version.TextColor3 = MUTED
Version.TextSize = 6
Version.Font = Enum.Font.GothamMedium
Version.TextXAlignment = Enum.TextXAlignment.Left
Version.Parent = Top

--============================================================--
-- STATUS
--============================================================--

local Status = Instance.new("TextLabel")

Status.Name = "Status"
Status.AnchorPoint = Vector2.new(1, 0.5)
Status.Position = UDim2.new(1, -80, 0.5, 0)
Status.Size = UDim2.fromOffset(80, 16)
Status.BackgroundTransparency = 1
Status.Text = "● READY"
Status.TextColor3 = ORANGE
Status.TextSize = 6
Status.Font = Enum.Font.GothamBold
Status.TextXAlignment = Enum.TextXAlignment.Right
Status.Parent = Top

--============================================================--
-- CLOSE
--============================================================--

local Close = Instance.new("TextButton")

Close.Name = "Close"
Close.Position = UDim2.new(1, -37, 0, 8)
Close.Size = UDim2.fromOffset(27, 27)
Close.BackgroundColor3 = CARD
Close.BorderSizePixel = 0
Close.Text = "×"
Close.TextColor3 = TEXT
Close.TextSize = 15
Close.Font = Enum.Font.GothamMedium
Close.AutoButtonColor = false
Close.Parent = Top

corner(Close, 6)
stroke(Close, 0.5, 1)

Close.MouseEnter:Connect(function()
    tween(Close, 0.12, {
        BackgroundColor3 = HOVER,
        Rotation = 4
    })
end)

Close.MouseLeave:Connect(function()
    tween(Close, 0.12, {
        BackgroundColor3 = CARD,
        Rotation = 0
    })
end)

--============================================================--
-- BODY
--============================================================--

local Body = Instance.new("Frame")

Body.Name = "Body"
Body.Position = UDim2.fromOffset(7, 51)
Body.Size = UDim2.new(1, -14, 1, -58)
Body.BackgroundTransparency = 1
Body.Parent = Main

--============================================================--
-- SIDEBAR
--============================================================--

local Sidebar = Instance.new("Frame")

Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.fromOffset(104, 232)
Sidebar.BackgroundColor3 = PANEL
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Body

corner(Sidebar, 8)
stroke(Sidebar, 0.25, 1)

local SideHeader = Instance.new("TextLabel")

SideHeader.Name = "Header"
SideHeader.Position = UDim2.fromOffset(10, 8)
SideHeader.Size = UDim2.new(1, -20, 0, 14)
SideHeader.BackgroundTransparency = 1
SideHeader.Text = "NYXORA"
SideHeader.TextColor3 = TEXT
SideHeader.TextSize = 7
SideHeader.Font = Enum.Font.GothamBold
SideHeader.TextXAlignment = Enum.TextXAlignment.Left
SideHeader.Parent = Sidebar

local SideSub = Instance.new("TextLabel")

SideSub.Name = "Sub"
SideSub.Position = UDim2.fromOffset(10, 21)
SideSub.Size = UDim2.new(1, -20, 0, 10)
SideSub.BackgroundTransparency = 1
SideSub.Text = "navigation"
SideSub.TextColor3 = MUTED
SideSub.TextSize = 5
SideSub.Font = Enum.Font.GothamMedium
SideSub.TextXAlignment = Enum.TextXAlignment.Left
SideSub.Parent = Sidebar

local SideDivider = Instance.new("Frame")

SideDivider.Name = "Divider"
SideDivider.Position = UDim2.fromOffset(10, 34)
SideDivider.Size = UDim2.new(1, -20, 0, 1)
SideDivider.BackgroundColor3 = BORDER
SideDivider.BackgroundTransparency = 0.35
SideDivider.BorderSizePixel = 0
SideDivider.Parent = Sidebar

local Nav = Instance.new("ScrollingFrame")

Nav.Name = "Navigation"
Nav.Position = UDim2.fromOffset(6, 39)
Nav.Size = UDim2.new(1, -12, 1, -45)
Nav.BackgroundTransparency = 1
Nav.BorderSizePixel = 0
Nav.ScrollBarThickness = 2
Nav.ScrollBarImageColor3 = ORANGE
Nav.ScrollBarImageTransparency = 0.2
Nav.AutomaticCanvasSize = Enum.AutomaticSize.Y
Nav.Parent = Sidebar

local NavLayout = Instance.new("UIListLayout")

NavLayout.Padding = UDim.new(0, 3)
NavLayout.SortOrder = Enum.SortOrder.LayoutOrder
NavLayout.Parent = Nav

--============================================================--
-- CONTENT
--============================================================--

local Content = Instance.new("Frame")

Content.Name = "Content"
Content.Position = UDim2.fromOffset(111, 0)
Content.Size = UDim2.new(1, -111, 1, 0)
Content.BackgroundColor3 = PANEL
Content.BorderSizePixel = 0
Content.ClipsDescendants = true
Content.Parent = Body

corner(Content, 8)
stroke(Content, 0.25, 1)

--============================================================--
-- PAGE DATA
--============================================================--

local PageData = {

    Home = {
        {"Reanimate", "Character system"},
        {"FE Hat", "Visual system"},
        {"Animations", "Animation library"},
        {"Script", "Project scripts"}
    },

    Reanimate = {
        {"R6", "R6 section"},
        {"R15", "R15 section"},
        {"Preview", "Preview"},
        {"Presets", "Saved setups"}
    },

    ["FE Hat"] = {
        {"Preview", "Visual preview"},
        {"Appearance", "Appearance"},
        {"Sounds", "Project sounds"},
        {"Presets", "Saved setups"}
    },

    Animations = {
        {"Idle", "Animation collection"},
        {"Walk", "Animation collection"},
        {"Run", "Animation collection"},
        {"Combat", "Animation collection"},
        {"Dance", "Animation collection"},
        {"Custom", "Custom animations"}
    },

    Script = {
        {"Animation", "Animation scripts"},
        {"Visual", "Visual scripts"},
        {"Library", "Project library"},
        {"Presets", "Script presets"},
        {"Info", "Information"}
    },

    R6 = {
        {"Idle", "R6 idle"},
        {"Walk", "R6 walk"},
        {"Run", "R6 run"},
        {"Jump", "R6 jump"},
        {"Custom", "Custom"}
    },

    R15 = {
        {"Idle", "R15 idle"},
        {"Walk", "R15 walk"},
        {"Run", "R15 run"},
        {"Jump", "R15 jump"},
        {"Custom", "Custom"}
    },

    Sounds = {
        {"Interface", "Interface audio"},
        {"Visual", "Visual audio"},
        {"Preview", "Audio preview"},
        {"Settings", "Audio settings"}
    },

    Settings = {
        {"Interface", "Interface"},
        {"Animation", "UI animation"},
        {"Performance", "Performance"},
        {"Reset", "Reset interface"}
    },

    About = {
        {"Nyxora", "Project information"},
        {"Version", "Version information"},
        {"Credits", "Credits"}
    }
}

--============================================================--
-- PAGE OBJECTS
--============================================================--

local Pages = {}
local NavButtons = {}

for pageName in pairs(PageData) do

    local Page = Instance.new("Frame")

    Page.Name = pageName
    Page.Size = UDim2.fromScale(1, 1)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.Parent = Content

    Pages[pageName] = Page

end

--============================================================--
-- MINI BUTTON
--============================================================--

local Mini = Instance.new("TextButton")

Mini.Name = "NyxoraMini"
Mini.AnchorPoint = Vector2.new(0.5, 0.5)
Mini.Position = UDim2.new(0, 29, 0.5, 0)
Mini.Size = UDim2.fromOffset(40, 40)
Mini.BackgroundColor3 = PANEL
Mini.BorderSizePixel = 0
Mini.Text = "N"
Mini.TextColor3 = TEXT
Mini.TextSize = 12
Mini.Font = Enum.Font.GothamBold
Mini.AutoButtonColor = false
Mini.Visible = false
Mini.Parent = Gui

corner(Mini, 8)
stroke(Mini, 0.15, 1)

local MiniLine = Instance.new("Frame")

MiniLine.Name = "MiniLine"
MiniLine.AnchorPoint = Vector2.new(0.5, 1)
MiniLine.Position = UDim2.new(0.5, 0, 1, -3)
MiniLine.Size = UDim2.fromOffset(0, 2)
MiniLine.BackgroundColor3 = ORANGE
MiniLine.BorderSizePixel = 0
MiniLine.Parent = Mini

corner(MiniLine, 2)

local MiniClose = Instance.new("TextButton")

MiniClose.Name = "MiniClose"
MiniClose.AnchorPoint = Vector2.new(0.5, 0.5)
MiniClose.Position = UDim2.new(1, -1, 0, 1)
MiniClose.Size = UDim2.fromOffset(15, 15)
MiniClose.BackgroundColor3 = CARD
MiniClose.BorderSizePixel = 0
MiniClose.Text = "×"
MiniClose.TextColor3 = TEXT
MiniClose.TextSize = 8
MiniClose.Font = Enum.Font.GothamBold
MiniClose.AutoButtonColor = false
MiniClose.Parent = Mini

corner(MiniClose, 4)

--============================================================--
-- STATE
--============================================================--

local CurrentPage = "Home"
local PreviousPage = "Home"

local WindowBusy = false
local Switching = false

--============================================================--
-- CARD HELPERS
--============================================================--

local function getCards(page)

    local cards = {}

    for _, object in ipairs(page:GetChildren()) do

        if object:IsA("TextButton")
        and object.Name:sub(1, 5) == "Card_" then

            table.insert(cards, object)

        end

    end

    table.sort(cards, function(a, b)
        return a.LayoutOrder < b.LayoutOrder
    end)

    return cards

end

local function resetCard(card)

    local x = card:GetAttribute("BaseX")
    local y = card:GetAttribute("BaseY")

    if x and y then
        card.Position = UDim2.fromOffset(x, y)
    end

    card.BackgroundTransparency = 0
    card.BackgroundColor3 = CARD
    card:SetAttribute("Selected", false)

    local line = card:FindFirstChild("OrangeLine")
    local side = card:FindFirstChild("SideAccent")

    if line then
        line.Size = UDim2.fromOffset(0, 2)
        line.BackgroundTransparency = 0
    end

    if side then
        side.BackgroundTransparency = 1
    end

    for _, child in ipairs(card:GetChildren()) do

        if child:IsA("TextLabel") then
            child.TextTransparency = 0
        end

    end

end

local function resetPage(page)

    for _, card in ipairs(getCards(page)) do
        resetCard(card)
    end

end

--============================================================--
-- PAGE ANIMATION
--============================================================--

local function animatePageOut(page)

    local cards = getCards(page)

    for index, card in ipairs(cards) do

        task.delay((index - 1) * 0.025, function()

            if not card or not card.Parent then
                return
            end

            local x = card:GetAttribute("BaseX")
            local y = card:GetAttribute("BaseY")

            if not x or not y then
                return
            end

            tween(card, 0.13, {
                Position = UDim2.fromOffset(x - 20, y),
                BackgroundTransparency = 1
            }, Enum.EasingStyle.Quart, Enum.EasingDirection.In)

            for _, child in ipairs(card:GetChildren()) do

                if child:IsA("TextLabel") then

                    tween(child, 0.12, {
                        TextTransparency = 1
                    })

                elseif child:IsA("Frame")
                and child.Name == "OrangeLine" then

                    tween(child, 0.12, {
                        BackgroundTransparency = 1
                    })

                elseif child:IsA("Frame")
                and child.Name == "SideAccent" then

                    tween(child, 0.12, {
                        BackgroundTransparency = 1
                    })

                end

            end

        end)

    end

    task.wait(0.15 + (#cards * 0.025))

    resetPage(page)

    page.Visible = false

end

local function animatePageIn(page)

    page.Visible = true

    local cards = getCards(page)

    for _, card in ipairs(cards) do

        local x = card:GetAttribute("BaseX")
        local y = card:GetAttribute("BaseY")

        if x and y then

            card.Position = UDim2.fromOffset(x + 20, y)

        end

        card.BackgroundTransparency = 1

        local line = card:FindFirstChild("OrangeLine")
        local side = card:FindFirstChild("SideAccent")

        if line then
            line.BackgroundTransparency = 1
        end

        if side then
            side.BackgroundTransparency = 1
        end

        for _, child in ipairs(card:GetChildren()) do

            if child:IsA("TextLabel") then
                child.TextTransparency = 1
            end

        end

    end

    for index, card in ipairs(cards) do

        task.delay((index - 1) * 0.035, function()

            if not card or not card.Parent then
                return
            end

            local x = card:GetAttribute("BaseX")
            local y = card:GetAttribute("BaseY")

            if not x or not y then
                return
            end

            tween(card, 0.16, {
                Position = UDim2.fromOffset(x, y),
                BackgroundTransparency = 0
            }, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

            for _, child in ipairs(card:GetChildren()) do

                if child:IsA("TextLabel") then

                    tween(child, 0.16, {
                        TextTransparency = 0
                    })

                elseif child:IsA("Frame")
                and child.Name == "OrangeLine" then

                    tween(child, 0.16, {
                        BackgroundTransparency = 0
                    })

                end

            end

        end)

    end

end

--============================================================--
-- NAVIGATION STATE
--============================================================--

local SelectedNav

local function selectNav(name)

    local button = NavButtons[name]

    if not button then
        return
    end

    if SelectedNav and SelectedNav ~= button then

        tween(SelectedNav, 0.1, {
            BackgroundColor3 = PANEL
        })

        local oldLine = SelectedNav:FindFirstChild("ActiveLine")

        if oldLine then

            tween(oldLine, 0.1, {
                Size = UDim2.fromOffset(0, 16)
            })

        end

    end

    SelectedNav = button

    tween(button, 0.1, {
        BackgroundColor3 = CARD
    })

    local line = button:FindFirstChild("ActiveLine")

    if line then

        tween(line, 0.12, {
            Size = UDim2.fromOffset(2, 16)
        })

    end

end

--============================================================--
-- PAGE SWITCH
--============================================================--

local function switchPage(name)

    if Switching then
        return
    end

    if not Pages[name] then
        return
    end

    if CurrentPage == name then
        selectNav(name)
        return
    end

    Switching = true

    PreviousPage = CurrentPage

    local oldPage = Pages[CurrentPage]
    local newPage = Pages[name]

    selectNav(name)

    animatePageOut(oldPage)

    CurrentPage = name

    animatePageIn(newPage)

    task.wait(0.16 + (#getCards(newPage) * 0.035))

    Switching = false

end

--============================================================--
-- CARD CREATOR
--============================================================--

local function createCard(page, pageName, index, name, description)

    local column = (index - 1) % 2
    local row = math.floor((index - 1) / 2)

    local x = 13 + (column * 151)
    local y = 61 + (row * 58)

    local card = Instance.new("TextButton")

    card.Name = "Card_" .. name
    card.LayoutOrder = index
    card.Position = UDim2.fromOffset(x, y)
    card.Size = UDim2.fromOffset(140, 49)
    card.BackgroundColor3 = CARD
    card.BorderSizePixel = 0
    card.Text = ""
    card.AutoButtonColor = false
    card.Parent = page

    card:SetAttribute("BaseX", x)
    card:SetAttribute("BaseY", y)
    card:SetAttribute("Selected", false)

    corner(card, 7)
    stroke(card, 0.45, 1)

    local title = Instance.new("TextLabel")

    title.Name = "Title"
    title.Position = UDim2.fromOffset(10, 7)
    title.Size = UDim2.new(1, -20, 0, 15)
    title.BackgroundTransparency = 1
    title.Text = name
    title.TextColor3 = TEXT
    title.TextSize = 7
    title.Font = Enum.Font.GothamSemibold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = card

    local desc = Instance.new("TextLabel")

    desc.Name = "Description"
    desc.Position = UDim2.fromOffset(10, 25)
    desc.Size = UDim2.new(1, -20, 0, 13)
    desc.BackgroundTransparency = 1
    desc.Text = description
    desc.TextColor3 = MUTED
    desc.TextSize = 5
    desc.Font = Enum.Font.Gotham
    desc.TextXAlignment = Enum.TextXAlignment.Left
    desc.Parent = card

    local line = Instance.new("Frame")

    line.Name = "OrangeLine"
    line.AnchorPoint = Vector2.new(0.5, 1)
    line.Position = UDim2.new(0.5, 0, 1, -3)
    line.Size = UDim2.fromOffset(0, 2)
    line.BackgroundColor3 = ORANGE
    line.BorderSizePixel = 0
    line.Parent = card

    corner(line, 2)

    local side = Instance.new("Frame")

    side.Name = "SideAccent"
    side.Position = UDim2.fromOffset(0, 8)
    side.Size = UDim2.fromOffset(2, 33)
    side.BackgroundColor3 = ORANGE
    side.BackgroundTransparency = 1
    side.BorderSizePixel = 0
    side.Parent = card

    corner(side, 2)

    card.MouseEnter:Connect(function()

        if not card:GetAttribute("Selected") then

            tween(card, 0.1, {
                BackgroundColor3 = HOVER
            })

            tween(line, 0.12, {
                Size = UDim2.fromOffset(35, 2)
            })

            tween(side, 0.12, {
                BackgroundTransparency = 0
            })

        end

    end)

    card.MouseLeave:Connect(function()

        if not card:GetAttribute("Selected") then

            tween(card, 0.1, {
                BackgroundColor3 = CARD
            })

            tween(line, 0.12, {
                Size = UDim2.fromOffset(0, 2)
            })

            tween(side, 0.12, {
                BackgroundTransparency = 1
            })

        end

    end)

    card.MouseButton1Click:Connect(function()

        if Switching then
            return
        end

        card:SetAttribute("Selected", true)

        tween(card, 0.1, {
            BackgroundColor3 = HOVER
        })

        tween(line, 0.12, {
            Size = UDim2.fromOffset(58, 2)
        })

        tween(side, 0.12, {
            BackgroundTransparency = 0
        })

        if pageName == "Home" then

            if name == "Reanimate"
            or name == "FE Hat"
            or name == "Animations"
            or name == "Script" then

                switchPage(name)

            end

        end

    end)

end

--============================================================--
-- BUILD PAGES
--============================================================--

for pageName, data in pairs(PageData) do

    local page = Pages[pageName]

    local back = Instance.new("TextButton")

    back.Name = "Back"
    back.Position = UDim2.fromOffset(11, 10)
    back.Size = UDim2.fromOffset(27, 23)
    back.BackgroundColor3 = CARD
    back.BorderSizePixel = 0
    back.Text = "‹"
    back.TextColor3 = TEXT
    back.TextSize = 16
    back.Font = Enum.Font.GothamMedium
    back.AutoButtonColor = false
    back.Parent = page

    corner(back, 5)
    stroke(back, 0.55, 1)

    local title = Instance.new("TextLabel")

    title.Name = "PageTitle"
    title.Position = UDim2.fromOffset(47, 10)
    title.Size = UDim2.new(1, -65, 0, 18)
    title.BackgroundTransparency = 1
    title.Text = pageName
    title.TextColor3 = TEXT
    title.TextSize = 13
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = page

    local small = Instance.new("TextLabel")

    small.Name = "PageSubtitle"
    small.Position = UDim2.fromOffset(48, 28)
    small.Size = UDim2.new(1, -65, 0, 9)
    small.BackgroundTransparency = 1
    small.Text = "NYXORA  /  " .. string.lower(pageName)
    small.TextColor3 = MUTED
    small.TextSize = 5
    small.Font = Enum.Font.GothamMedium
    small.TextXAlignment = Enum.TextXAlignment.Left
    small.Parent = page

    local headerLine = Instance.new("Frame")

    headerLine.Name = "HeaderLine"
    headerLine.Position = UDim2.fromOffset(11, 45)
    headerLine.Size = UDim2.new(1, -22, 0, 1)
    headerLine.BackgroundColor3 = BORDER
    headerLine.BackgroundTransparency = 0.5
    headerLine.BorderSizePixel = 0
    headerLine.Parent = page

    back.MouseEnter:Connect(function()

        tween(back, 0.1, {
            BackgroundColor3 = HOVER
        })

    end)

    back.MouseLeave:Connect(function()

        tween(back, 0.1, {
            BackgroundColor3 = CARD
        })

    end)

    back.MouseButton1Click:Connect(function()

        if not Switching and pageName ~= "Home" then
            switchPage("Home")
        end

    end)

    for index, item in ipairs(data) do

        createCard(
            page,
            pageName,
            index,
            item[1],
            item[2]
        )

    end

end

--============================================================--
-- NAV BUTTONS
--============================================================--

local Navigation = {
    "Home",
    "Reanimate",
    "FE Hat",
    "Animations",
    "Script",
    "R6",
    "R15",
    "Sounds",
    "Settings",
    "About"
}

for index, name in ipairs(Navigation) do

    local button = Instance.new("TextButton")

    button.Name = "Nav_" .. name
    button.Size = UDim2.new(1, -2, 0, 26)
    button.BackgroundColor3 = PANEL
    button.BorderSizePixel = 0
    button.Text = "   " .. string.upper(name)
    button.TextColor3 = MUTED
    button.TextSize = 6
    button.Font = Enum.Font.GothamMedium
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.AutoButtonColor = false
    button.LayoutOrder = index
    button.Parent = Nav

    corner(button, 5)

    local line = Instance.new("Frame")

    line.Name = "ActiveLine"
    line.Position = UDim2.fromOffset(0, 5)
    line.Size = UDim2.fromOffset(0, 16)
    line.BackgroundColor3 = ORANGE
    line.BorderSizePixel = 0
    line.Parent = button

    corner(line, 2)

    NavButtons[name] = button

    button.MouseEnter:Connect(function()

        if SelectedNav ~= button then

            tween(button, 0.1, {
                BackgroundColor3 = CARD
            })

        end

    end)

    button.MouseLeave:Connect(function()

        if SelectedNav ~= button then

            tween(button, 0.1, {
                BackgroundColor3 = PANEL
            })

        end

    end)

    button.MouseButton1Click:Connect(function()

        if Switching then
            return
        end

        switchPage(name)

    end)

end

--============================================================--
-- OPEN / CLOSE
--============================================================--

local function closeHub()

    if WindowBusy or not Main.Visible then
        return
    end

    WindowBusy = true

    tween(Main, 0.22, {
        Size = UDim2.fromOffset(20, 20)
    }, Enum.EasingStyle.Back, Enum.EasingDirection.In)

    task.wait(0.23)

    Main.Visible = false

    Mini.Visible = true
    Mini.Size = UDim2.fromOffset(0, 0)

    tween(Mini, 0.22, {
        Size = UDim2.fromOffset(40, 40)
    }, Enum.EasingStyle.Back)

    WindowBusy = false

end

local function openHub()

    if WindowBusy or Main.Visible then
        return
    end

    WindowBusy = true

    tween(Mini, 0.16, {
        Size = UDim2.fromOffset(0, 0)
    }, Enum.EasingStyle.Back, Enum.EasingDirection.In)

    task.wait(0.17)

    Mini.Visible = false

    Main.Visible = true
    Main.Size = UDim2.fromOffset(20, 20)

    tween(Main, 0.25, {
        Size = UDim2.fromOffset(WIDTH, HEIGHT)
    }, Enum.EasingStyle.Back)

    task.wait(0.25)

    WindowBusy = false

end

--============================================================--
-- BUTTON CONNECTIONS
--============================================================--

Close.MouseButton1Click:Connect(closeHub)

Mini.MouseButton1Click:Connect(openHub)

MiniClose.MouseButton1Click:Connect(function()

    if WindowBusy then
        return
    end

    WindowBusy = true

    tween(Mini, 0.14, {
        Size = UDim2.fromOffset(0, 0)
    }, Enum.EasingStyle.Back, Enum.EasingDirection.In)

    task.wait(0.14)

    Mini.Visible = false
    WindowBusy = false

end)

Mini.MouseEnter:Connect(function()

    tween(Mini, 0.12, {
        Size = UDim2.fromOffset(44, 44),
        BackgroundColor3 = HOVER
    }, Enum.EasingStyle.Back)

    tween(MiniLine, 0.12, {
        Size = UDim2.fromOffset(18, 2)
    })

end)

Mini.MouseLeave:Connect(function()

    tween(Mini, 0.12, {
        Size = UDim2.fromOffset(40, 40),
        BackgroundColor3 = PANEL
    })

    tween(MiniLine, 0.12, {
        Size = UDim2.fromOffset(0, 2)
    })

end)

--============================================================--
-- INITIAL STATE
--============================================================--

Pages.Home.Visible = true

selectNav("Home")

--============================================================--
-- ENTRY ANIMATION
--============================================================--

Main.Size = UDim2.fromOffset(20, 20)

tween(Main, 0.3, {
    Size = UDim2.fromOffset(WIDTH, HEIGHT)
}, Enum.EasingStyle.Back)

task.spawn(function()

    local intro = Instance.new("Frame")

    intro.Name = "Intro"
    intro.Size = UDim2.fromScale(1, 1)
    intro.BackgroundColor3 = BG
    intro.BorderSizePixel = 0
    intro.ZIndex = 100
    intro.Parent = Main

    corner(intro, 10)

    local logo = Instance.new("TextLabel")

    logo.Name = "Logo"
    logo.AnchorPoint = Vector2.new(0.5, 0.5)
    logo.Position = UDim2.fromScale(0.5, 0.45)
    logo.Size = UDim2.fromOffset(250, 35)
    logo.BackgroundTransparency = 1
    logo.Text = "NYXORA"
    logo.TextColor3 = TEXT
    logo.TextTransparency = 1
    logo.TextSize = 23
    logo.Font = Enum.Font.GothamBold
    logo.ZIndex = 101
    logo.Parent = intro

    local sub = Instance.new("TextLabel")

    sub.Name = "Subtitle"
    sub.AnchorPoint = Vector2.new(0.5, 0.5)
    sub.Position = UDim2.fromScale(0.5, 0.57)
    sub.Size = UDim2.fromOffset(180, 15)
    sub.BackgroundTransparency = 1
    sub.Text = "BETA 1.9"
    sub.TextColor3 = MUTED
    sub.TextTransparency = 1
    sub.TextSize = 6
    sub.Font = Enum.Font.GothamMedium
    sub.ZIndex = 101
    sub.Parent = intro

    local line = Instance.new("Frame")

    line.Name = "IntroLine"
    line.AnchorPoint = Vector2.new(0.5, 0.5)
    line.Position = UDim2.fromScale(0.5, 0.68)
    line.Size = UDim2.fromOffset(0, 2)
    line.BackgroundColor3 = ORANGE
    line.BorderSizePixel = 0
    line.ZIndex = 101
    line.Parent = intro

    corner(line, 2)

    tween(logo, 0.28, {
        TextTransparency = 0
    })

    task.wait(0.08)

    tween(sub, 0.2, {
        TextTransparency = 0
    })

    tween(line, 0.25, {
        Size = UDim2.fromOffset(65, 2)
    })

    task.wait(0.55)

    tween(logo, 0.18, {
        TextTransparency = 1
    })

    tween(sub, 0.18, {
        TextTransparency = 1
    })

    tween(line, 0.18, {
        Size = UDim2.fromOffset(0, 2)
    })

    task.wait(0.2)

    if intro and intro.Parent then
        intro:Destroy()
    end

end)

--============================================================--
-- END
--============================================================--
