-- Creates and displays a small info box
-- @param x : the abscissa
-- @param y : the ordinate
-- @param label : the label of the info
-- @returns : the Infobox object
Infobox = {}
Infobox.new = function(x, y)
    local self = Navbox.new(y, '', 0, '')
    move(self.labelTxt, x)
    txt_style(self.labelTxt, "font:" .. G.FONT .. ";color:" .. G.COLOR_SECONDARY .. ";size:16;halign:right;")
    visible(self.valueTxt, false)
    visible(self.unitTxt, false)

    -- Sets the value of the infobox
    -- @param value : the value to be displayed
    function self.setValue(value)
        txt_set(self.labelTxt, value)
    end

    -- Toggles on or off the infobox
    -- @param on : true if visible, false otherwise
    function self.toggle(on)
        visible(self.labelTxt, on)
    end

    return self
end