local DeferralCards = {
    Card = {},
    CardElement = {},
    Container = {},
    Action = {},
    Input = {}
}

exports('DeferralCards', function()
    return DeferralCards
end)

--------------------------------------------------[[ Cards ]]--------------------------------------------------

function DeferralCards.Card.Create(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'AdaptiveCard'
    pOptions.version = pOptions.version or '1.4'
    pOptions.body = pOptions.body or {}
    pOptions['$schema'] = 'http://adaptivecards.io/schemas/adaptive-card.json'
    return json.encode(pOptions)
end
--[[
    DeferralCards.Card:Create({
        body = {
            DeferralCards.CardElement:Image({
                url = '',
                size = 'small',
                horizontalAlignment = 'center'
            }),
            DeferralCards.CardElement:TextBlock({
                text = 'Text',
                weight = 'Light',
                horizontalAlignment = 'center'
            }),
        }
    })
]]

--------------------------------------------------[[ Card Elements ]]--------------------------------------------------

function DeferralCards.CardElement.TextBlock(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'TextBlock'
    pOptions.text = pOptions.text or 'Text'
    return pOptions
end
--[[
    DeferralCards.CardElement:TextBlock({
        size = 'small',
        weight = 'Light',
        text = 'Some text',
        wrap = true
    })
]]

function DeferralCards.CardElement.Image(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Image'
    pOptions.url = pOptions.url or 'https://via.placeholder.com/100x100?text=Temp+Image'
    return pOptions
end
--[[
    DeferralCards.CardElement:Image({
        url = 'https://via.placeholder.com/100x100?text=Temp+Image'
    })
]]

function DeferralCards.CardElement.Media(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Media'
    pOptions.sources = pOptions.sources or {}
    return pOptions
end
--[[
    DeferralCards.CardElement:Media({
        poster = 'https://adaptivecards.io/content/poster-video.png',
        sources = {}
    })
]]

function DeferralCards.CardElement.MediaSource(self, pOptions)
    if not pOptions then return end
    pOptions.mimeType = pOptions.mimeType or 'video/mp4'
    pOptions.url = pOptions.url or ''
    return pOptions
end
--[[
    DeferralCards.CardElement:MediaSource({
        mimeType = 'video/mp4',
        url = ''
    })
]]

function DeferralCards.CardElement.RichTextBlockItem(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'TextRun'
    pOptions.text = pOptions.text or 'Text'
    return pOptions
end
--[[
    DeferralCards.CardElement:RichTextBlockItem({
        text = 'Item 1',
        size = 'small',
        color = 'good',
        isSubtle = true,
        weight = 'small',
        highlight = true,
        italic = false,
        strikethrough = false,
        fontType = 'monospace'
    })
]]

function DeferralCards.CardElement.RichTextBlock(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'RichTextBlock'
    pOptions.inline = pOptions.inline or {}
    return pOptions
end
--[[
    DeferralCards.CardElement:RichTextBlock({
        horizontalAlignment = 'center',
        inline = {
            DeferralCards.CardElement:RichTextBlockItem({
                text = 'Item 1',
                size = 'small',
                color = 'good',
                isSubtle = true,
                weight = 'small',
                highlight = true
            }),
            DeferralCards.CardElement:RichTextBlockItem({
                text = 'Item 2',
                size = 'medium',
                color = 'good',
                isSubtle = false,
                weight = 'large',
                highlight = false
            })
        }
    })
]]

function DeferralCards.CardElement.TextRun(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'TextRun'
    pOptions.text = pOptions.text or 'Text'
    return pOptions
end
--[[
    DeferralCards.CardElement:TextRun({
        text = 'Text',
        color = 'good',
        fontType = 'monospace',
        highlight = false,
        isSubtle = false,
        italic = false,
        size = 'small',
        strikethrough = false,
        underline = false,
        weight = 'medium'
    })
]]

--------------------------------------------------[[ Containers ]]--------------------------------------------------

function DeferralCards.Container.Create(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Container'
    pOptions.items = pOptions.items or {}
    return pOptions
end
--[[
    DeferralCards.Container:Create({
        items = {}
    })
]]

function DeferralCards.Container.ActionSet(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'ActionSet'
    pOptions.actions = pOptions.actions or {}
    return pOptions
end
--[[
    DeferralCards.Container:ActionSet({
        actions = {},
    })
]]

function DeferralCards.Container.ColumnSet(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'ColumnSet'
    pOptions.columns = pOptions.columns or {}
    return pOptions
end
--[[
    DeferralCards.Container:ColumnSet({
        columns = {}
    })
]]

function DeferralCards.Container.Column(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Column'
    pOptions.items = pOptions.items or {}
    return pOptions
end
--[[
    DeferralCards.Container:Column({
        items = {},
        width = 'auto'
    })
]]

function DeferralCards.Container.Fact(self, pOptions)
    if not pOptions then return end
    pOptions.title = pOptions.title or 'Title'
    pOptions.value = pOptions.value or 'Value'
    return pOptions
end
--[[
    DeferralCards.Container:Fact({
        title = 'Title',
        value = 'Value'
    })
]]

function DeferralCards.Container.FactSet(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'FactSet'
    pOptions.facts = pOptions.facts or {}
    return pOptions
end
--[[
    DeferralCards.Container:FactSet({
        facts = {
            DeferralCards.Container:Fact({
                title = 'Title 1',
                value = 'Value 1'
            }),
            DeferralCards.Container:Fact({
                title = 'Title 2',
                value = 'Value 2'
            })
        }
    })
]]

function DeferralCards.Container.ImageSetItem(self, pOptions)
    if not pOptions then return end
    pOptions.type = pOptions.type or 'Image'
    pOptions.url = pOptions.url or 'https://adaptivecards.io/content/cats/1.png'
    return pOptions
end
--[[
    DeferralCards.Container:ImageSetItem({
        type = 'Image',
        url = 'https://adaptivecards.io/content/cats/1.png'
    })
]]

function DeferralCards.Container.ImageSet(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'ImageSet'
    pOptions.images = pOptions.images or {}
    return pOptions
end
--[[
    DeferralCards.Container:ImageSet({
        images = {
            DeferralCards.Container:ImageSetItem({
                type = 'Image',
                url = 'https://adaptivecards.io/content/cats/1.png'
            }),
            DeferralCards.Container:ImageSetItem({
                type = 'Image',
                url = 'https://adaptivecards.io/content/cats/2.png'
            })
        }
    })
]]

--------------------------------------------------[[ Actions ]]--------------------------------------------------

function DeferralCards.Action.OpenUrl(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Action.OpenUrl'
    pOptions.url = pOptions.url or 'https://www.google.co.uk/'
    return pOptions
end
--[[
    DeferralCards.Action:OpenUrl({
        title = 'Title',
        url = 'https://www.google.co.uk/'
    })
]]

function DeferralCards.Action.Submit(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Action.Submit'
    return pOptions
end
--[[
    DeferralCards.Action:Submit({
        title = 'Title',
        data = {
            x = 10
        }
    })
]]

function DeferralCards.Action.ShowCard(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Action.ShowCard'
    return pOptions
end
--[[
    DeferralCards.Action:ShowCard({
        title = 'Title',
        card = {}
    })
]]

function DeferralCards.Action.TargetElement(self, pOptions)
    if not pOptions then return end
    pOptions.elementId = pOptions.elementId or 'target_element'
    return pOptions
end
--[[
    DeferralCards.Action:TargetElement({
        elementId = 'element_1',
        isVisible = true
    })
]]

function DeferralCards.Action.ToggleVisibility(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Action.ToggleVisibility'
    pOptions.targetElements = pOptions.targetElements or {}
    return pOptions
end
--[[
    DeferralCards.Action:ToggleVisibility({
        title = 'Title',
        targetElements = {
            Deferralcards.Action:TargetElement({
                elementId = 'element_1',
                isVisible = true
            }),
            Deferralcards.Action:TargetElement({
                elementId = 'element_2',
                isVisible = true
            })
        }
    })
]]

function DeferralCards.Action.Execute(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Action.Execute'
    return pOptions
end
--[[
    DeferralCards.Action:Execute({
        title = 'Title',
        verb = 'Verb',
        data = {
            x = 10
        }
    })
]]

--------------------------------------------------[[ Inputs ]]--------------------------------------------------

function DeferralCards.Input.Text(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.Text'
    pOptions.id = pOptions.id or 'input_text'
    return pOptions
end
--[[
    DeferralCards.Input:Text({
        id = 'input_text',
        text = 'Text',
        title = 'Title',
        placeholder = 'Placeholder'
    })
]]

function DeferralCards.Input.Number(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.Number'
    pOptions.id = pOptions.id or 'input_number'
    return pOptions
end
--[[
    DeferralCards.Input:Number({
        id = 'input_number',
        placeholder = 'Placeholder',
        min = 1,
        max = 10,
        value = 5
    })
]]

function DeferralCards.Input.Date(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.Date'
    pOptions.id = pOptions.id or 'input_date'
    return pOptions
end
--[[
    DeferralCards.Input:Date({
        id = 'input_date',
        placeholder = 'Placeholder',
        value = '2021-08-13'
    })
]]

function DeferralCards.Input.Time(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.Time'
    pOptions.id = pOptions.id or 'input_time'
    return pOptions
end
--[[
    DeferralCards.Input:Time({
        id = 'input_time',
        placeholder = 'Placeholder',
        min = '00:00',
        max = '23:59',
        value = '19:00'
    })
]]

function DeferralCards.Input.Toggle(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.Toggle'
    pOptions.title = pOptions.title or 'Title'
    pOptions.id = pOptions.id or 'input_toggle'
    return pOptions
end
--[[
    DeferralCards.Input:Toggle({
        id = 'input_toggle',
        title = 'Title',
        value = 'true',
        valueOn = 'true',
        valueOff = 'false'
    })
]]

function DeferralCards.Input.Choice(self, pOptions)
    if not pOptions then return end
    pOptions.title = pOptions.title or 'Title'
    pOptions.value = pOptions.value or 'Value'
    return pOptions
end
--[[
    DeferralCards.Input:Choice({
        title = 'Title',
        value = 'Value'
    })
]]

function DeferralCards.Input.ChoiceSet(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.ChoiceSet'
    pOptions.choices = pOptions.choices or {}
    pOptions.id = pOptions.id or 'choice_set'
    return pOptions
end
--[[
    DeferralCards.Input:ChoiceSet({
        placeholder = 'Text',
        choices = {
            DeferralCards.Input:Choice({
                title = 'Title 1',
                value = 'Value 1'
            }),
            DeferralCards.Input:Choice({
                title = 'Title 2',
                value = 'Value 2'
            })
        }
    })
]]