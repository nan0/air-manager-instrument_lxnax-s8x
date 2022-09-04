-- The vario main object
-- @returns : the Vario object
Vario = {}
Vario.new = function()
    local self = {}
    local availableModes = { WayPointMode }
    local varioHistory = History.new(S_AVG_VARIO_TIME)
    local nettoHistory = History.new(S_AVG_NETTO_TIME)

    self.modeNavigator = nil
    self.needle = nil
    self.yellowBar = nil
    self.redDiamond = nil
    self.knobTop = nil
    self.knobBottom = nil

    -- Sets the orange needle to the total energy vario value, and displays the min/max vario in the yellow line
    -- @param totalEnergy : the latest total energy vario value
    function updateVario(totalEnergy)
        self.needle.setValue(totalEnergy)
        varioHistory.addAndCompute(totalEnergy)
        self.yellowBar.setValue(varioHistory.getMin(), varioHistory.getMax())
    end

    -- Sets the red diamond to the avg. netto
    -- @param netto : the latest netto value
    function updateNetto(netto)
        local avgNetto = 0
        avgNetto = nettoHistory.addAndCompute(netto).getAvg()
        self.redDiamond.setValue(avgNetto)
    end

    -- Inits the vario
    function init()
        -- Needles and background init
        self.yellowBar = YellowBar.new()
        img_add_fullscreen("ls100_bg.png")
        txt_add("m/s", "font:" .. G.FONT .. "; color:" .. G.COLOR_INVERTED .. "; size:23; halign: right;", 310, 440, 30, 23)
        self.redDiamond = RedDiamond.new()
        self.needle = Needle.new()

        -- Navigator init
        self.modeNavigator = Navigator.new(availableModes)
        self.modeNavigator.currentItem.pageNavigator.currentItem.toggle(true)

        -- Vario button declarations
        self.knobTop = RotaryButton.new("top", self.modeNavigator.currentItem.onTopKnobPressed, self.modeNavigator.currentItem.onTopKnobRotated)
        self.knobBottom = RotaryButton.new("bottom", self.modeNavigator.currentItem.onBottomKnobPressed, self.modeNavigator.currentItem.onBottomKnobRotated)

        -- Subscriptions
        fs2020_variable_subscribe("L:TOTAL ENERGY", "FLOAT", updateVario)
        fs2020_variable_subscribe("L:NETTO", "FLOAT", updateNetto)
    end

    init()

    return self
end
