local DeferralCards = {}

exports('DeferralCards', function()
    return DeferralCards
end)

--------------------------------------------------[[ Cards ]]--------------------------------------------------

function DeferralCards:CreateAdaptiveCard(pOptions)
    if not pOptions then return end
    pOptions.type = 'AdaptiveCard'
    pOptions.version = pOptions.version or '1.4'
    pOptions.body = pOptions.body or {}
    pOptions.backgroundImage = pOptions.backgroundImage or {}
    pOptions['$schema'] = 'http://adaptivecards.io/schemas/adaptive-card.json'
    return json.encode(pOptions)
end
--[[
    DeferralCards:CreateAdaptiveCard({
        body = {},
        backgroundImage = '',
        version = '1.4'
    })
]]

--------------------------------------------------[[ Card Elements ]]--------------------------------------------------

function DeferralCards:CreateTextBlock(pOptions)
    if not pOptions then return end
    pOptions.type = 'TextBlock'
    pOptions.size = pOptions.size or 'ExtraLarge'
    pOptions.weight = pOptions.weight or 'Bolder'
    pOptions.text = pOptions.text or 'Text'
    pOptions.wrap = pOptions.wrap or true
    return pOptions
end
--[[
    DeferralCards:CreateTextBlock({
        size = 'small',
        weight = 'Light',
        text = 'Some text',
        wrap = true
    })
]]

function DeferralCards:CreateImage(pOptions)
    if not pOptions then return end
    pOptions.type = 'Image'
    pOptions.url = pOptions.url or 'https://via.placeholder.com/100x100?text=Temp+Image'
    return pOptions
end
--[[
    DeferralCards:CreateImage({
        url = 'https://via.placeholder.com/100x100?text=Temp+Image'
    })
]]

function DeferralCards:CreateMedia(pOptions)
    if not pOptions then return end
    pOptions.type = 'Media'
    pOptions.poster = pOptions.poster or 'https://adaptivecards.io/content/poster-video.png'
    pOptions.sources = pOptions.sources or {}
    return pOptions
end
--[[
    DeferralCards:CreateMedia({
        poster = 'https://adaptivecards.io/content/poster-video.png',
        sources = {}
    })
]]

function DeferralCards:CreateMediaSource(pOptions)
    if not pOptions then return end
    pOptions.mimeType = pOptions.mimeType or 'video/mp4'
    pOptions.url = pOptions.url or ''
    return pOptions
end
--[[
    DeferralCards:CreateMediaSource({
        mimeType = 'video/mp4',
        url = ''
    })
]]

function DeferralCards:CreateRichTextBlockItem(pOptions)
    if not pOptions then return end
    pOptions.type = 'TextRun'
    pOptions.text = pOptions.text or 'Text'
    pOptions.size = pOptions.size or 'small'
    pOptions.color = pOptions.color or 'good'
    pOptions.isSubtle = pOptions.isSubtle or false
    pOptions.weight = pOptions.weight or 'small'
    pOptions.highlight = pOptions.highlight or false
    pOptions.italic = pOptions.italic or false
    pOptions.strikethrough = pOptions.strikethrough or false
    pOptions.fontType = pOptions.fontType or 'monospace'
    return pOptions
end
--[[
    DeferralCards:CreateRichTextBlockItem({
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

function DeferralCards:CreateRichTextBlock(pOptions)
    if not pOptions then return end
    pOptions.type = 'RichTextBlock'
    pOptions.horizontalAlignment = pOptions.horizontalAlignment or 'center'
    pOptions.inline = pOptions.inline or {}
    return pOptions
end
--[[
    DeferralCards:CreateRichTextBlock({
        horizontalAlignment = 'center',
        inline = {
            DeferralCards:CreateRichTextBlockItem({
                text = 'Item 1',
                size = 'small',
                color = 'good',
                isSubtle = true,
                weight = 'small',
                highlight = true
            }),
            DeferralCards:CreateRichTextBlockItem({
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

function DeferralCards:CreateTextRun(pOptions)
    if not pOptions then return end
    pOptions.type = 'TextRun'
    pOptions.text = pOptions.text or 'Text'
    pOptions.color = pOptions.color or 'good'
    pOptions.fontType = pOptions.fontType or 'monospace'
    pOptions.highlight = pOptions.highlight or false
    pOptions.isSubtle = pOptions.isSubtle = false
    pOptions.italic = pOptions.italic = false
    pOptions.size = pOptions.size or 'small'
    pOptions.strikethrough = pOptions.strikethrough = false
    pOptions.underline = pOptions.underline or false
    pOptions.weight = pOptions.weight or 'medium'
    return pOptions
end
--[[
    DeferralCards:CreateTextRun({
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

function DeferralCards:CreateActionSet(pOptions)
    if not pOptions then return end
    pOptions.type = 'ActionSet'
    pOptions.actions = pOptions.actions or {}
    return pOptions
end
--[[
    DeferralCards:CreateActionSet({
        actions = {},
    })
]]

function DeferralCards:CreateContainer(pOptions)
    if not pOptions then return end
    pOptions.type = 'Container'
    pOptions.items = pOptions.items or {}
    return pOptions
end
--[[
    DeferralCards:CreateContainer({
        items = {}
    })
]]

function DeferralCards:CreateColumnSet(pOptions)
    if not pOptions then return end
    pOptions.type = 'ColumnSet'
    pOptions.columns = pOptions.columns or {}
    return pOptions
end
--[[
    DeferralCards:CreateColumnSet({
        columns = {}
    })
]]

function DeferralCards:CreateColumn(pOptions)
    if not pOptions then return end
    pOptions.type = 'Column'
    pOptions.items = pOptions.items or {}
    pOptions.width = pOptions.width or 'auto'
    return pOptions
end
--[[
    DeferralCards:CreateColumn({
        items = {},
        width = 'auto'
    })
]]

function DeferralCards:CreateFact(pOptions)
    if not pOptions then return end
    pOptions.title = pOptions.title or 'Title'
    pOptions.value = pOptions.value or 'Value'
    return pOptions
end
--[[
    DeferralCards:CreateFact({
        title = 'Title',
        value = 'Value'
    })
]]

function DeferralCards:CreateFactSet(pOptions)
    if not pOptions then return end
    pOptions.type = 'FactSet'
    pOptions.facts = pOptions.facts or {}
    return pOptions
end
--[[
    DeferralCards:CreateFactSet({
        facts = {
            DeferralCards:CreateFact({
                title = 'Title 1',
                value = 'Value 1'
            }),
            DeferralCards:CreateFact({
                title = 'Title 2',
                value = 'Value 2'
            })
        }
    })
]]

function DeferralCards:CreateImageSetItem(pOptions)
    if not pOptions then return end
    pOptions.type = pOptions.type or 'Image'
    pOptions.url = pOptions.url or 'https://adaptivecards.io/content/cats/1.png'
    return pOptions
end
--[[
    DeferralCards:CreateImageSetItem({
        type = 'Image',
        url = 'https://adaptivecards.io/content/cats/1.png'
    })
]]

function DeferralCards:CreateImageSet(pOptions)
    if not pOptions then return end
    pOptions.type = 'ImageSet'
    pOptions.images = pOptions.images or {}
    return pOptions
end
--[[
    DeferralCards:CreateImageSet({
        images = {
            DeferralCards:CreateImageSetItem({
                type = 'Image',
                url = 'https://adaptivecards.io/content/cats/1.png'
            }),
            DeferralCards:CreateImageSetItem({
                type = 'Image',
                url = 'https://adaptivecards.io/content/cats/2.png'
            })
        }
    })
]]

--------------------------------------------------[[ Actions ]]--------------------------------------------------

function DeferralCards:CreateOpenUrlAction(pOptions)
    if not pOptions then return end
    pOptions.type = 'Action.OpenUrl'
    pOptions.title = pOptions.title or 'Title'
    pOptions.url = pOptions.url or 'https://www.google.co.uk/'
    return pOptions
end
--[[
    DeferralCards:CreateOpenUrlAction({
        title = 'Title',
        url = 'https://www.google.co.uk/'
    })
]]

function DeferralCards:CreateSubmitAction(pOptions)
    if not pOptions then return end
    pOptions.type = 'Action.Submit'
    pOptions.title = pOptions.title or 'Title'
    pOptions.data = pOptions.data or {}
    return pOptions
end
--[[
    DeferralCards:CreateSubmitAction({
        title = 'Title',
        data = {
            x = 10
        }
    })
]]

function DeferralCards:CreateShowCardAction(pOptions)
    if not pOptions then return end
    pOptions.type = 'Action.ShowCard'
    pOptions.title = pOptions.title or 'Title'
    pOptions.card = pOptions.card or {}
    return pOptions
end
--[[
    DeferralCards:CreateShowCardAction({
        title = 'Title',
        card = {}
    })
]]

function DeferralCards:CreateTargetElement(pOptions)
    if not pOptions then return end
    pOptions.elementId = pOptions.elementId or 'Id'
    pOptions.isVisible = pOptions.isVisible or true
    return pOptions
end
--[[
    Deferralcards:CreateTargetElement({
        elementId = 'element_1',
        isVisible = true
    })
]]

function DeferralCards:CreateToggleVisibilityAction(pOptions)
    if not pOptions then return end
    pOptions.type = 'Action.ToggleVisibility'
    pOptions.title = pOptions.title or 'Title'
    pOptions.targetElements = pOptions.targetElements or {}
    return pOptions
end
--[[
    DeferralCards:CreateToggleVisibilityAction({
        title = 'Title',
        targetElements = {
            Deferralcards:CreateTargetElement({
                elementId = 'element_1',
                isVisible = true
            }),
            Deferralcards:CreateTargetElement({
                elementId = 'element_2',
                isVisible = true
            })
        }
    })
]]

function DeferralCards:CreateExecuteAction(pOptions)
    if not pOptions then return end
    pOptions.type = 'Action.Execute'
    pOptions.title = pOptions.title or 'Title'
    pOptions.verb = pOptions.verb or 'Verb'
    pOptions.data = pOptions.data or {}
    return pOptions
end
--[[
    Deferralcards:CreateExecuteAction({
        title = 'Title',
        verb = 'Verb',
        data = {
            x = 10
        }
    })
]]

--------------------------------------------------[[ Inputs ]]--------------------------------------------------

function DeferralCards:CreateTextInput(pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.Text'
    pOptions.id = pOptions.id or 'input_text'
    pOptions.text = pOptions.text or 'Text'
    pOptions.title = pOptions.title or 'Title'
    pOptions.placeholder = pOptions.placeholder or 'Placeholder'
    return pOptions
end
--[[
    DeferralCards:CreateTextInput({
        id = 'input_text',
        text = 'Text',
        title = 'Title',
        placeholder = 'Placeholder'
    })
]]

function DeferralCards:CreateNumberInput(pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.Number'
    pOptions.id = pOptions.id or 'input_number'
    pOptions.placeholder = pOptions.placeholder or 'Placeholder'
    pOptions.min = pOptions.min or 1
    pOptions.max = pOptions.max or 10
    pOptions.value = pOptions.value or 5
    return pOptions
end
--[[
    DeferralCards:CreateNumberInput({
        id = 'input_number',
        placeholder = 'Placeholder',
        min = 1,
        max = 10,
        value = 5
    })
]]

function DeferralCards:CreateDateInput(pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.Date'
    pOptions.id = pOptions.id or 'input_date'
    pOptions.placeholder = pOptions.placeholder or 'Placeholder'
    pOptions.value = pOptions.value or '2021-08-13'
    return pOptions
end
--[[
    DeferralCards:CreateDateInput({
        id = 'input_date',
        placeholder = 'Placeholder',
        value = '2021-08-13'
    })
]]

function DeferralCards:CreateTimeInput(pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.Time'
    pOptions.id = pOptions.id or 'input_time'
    pOptions.min = pOptions.min or '00:00'
    pOptions.max = pOptions.max or '23:59'
    pOptions.value = pOptions.value or '19:00'
    return pOptions
end
--[[
    DeferralCards:CreateTimeInput({
        id = 'input_time',
        placeholder = 'Placeholder',
        min = '00:00',
        max = '23:59',
        value = '19:00'
    })
]]

function DeferralCards:CreateToggleInput(pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.Toggle'
    pOptions.id = pOptions.id or 'input_toggle'
    pOptions.title = pOptions.title = 'Title'
    pOptions.value = pOptions.value or 'true'
    pOptions.valueOn = pOptions.valueOn or 'true'
    pOptions.valueOff = pOptions.valueOff or 'false'
    return pOptions
end
--[[
    DeferralCards:CreateToggleInput({
        id = 'input_toggle',
        title = 'Title',
        value = 'true',
        valueOn = 'true',
        valueOff = 'false'
    })
]]

function DeferralCards:CreateChoice(pOptions)
    if not pOptions then return end
    pOptions.title = pOptions.title or 'Title'
    pOptions.value = pOptions.value or 'Value'
    return pOptions
end
--[[
    DeferralCards:CreateChoice({
        title = 'Title',
        value = 'Value'
    })
]]

function DeferralCards:CreateChoiceSet(pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.ChoiceSet'
    pOptions.choices = pOptions.choices or {}
    pOptions.placeholder = pOptions.placeholder or 'Placeholder'
    return pOptions
end
--[[
    DeferralCards:CreateChoiceSet({
        placeholder = 'Text',
        choices = {
            DeferralCards:CreateChoice({
                title = 'Title 1',
                value = 'Value 1'
            }),
            DeferralCards:CreateChoice({
                title = 'Title 2',
                value = 'Value 2'
            })
        }
    })
]]