# FiveM Adaptive Cards For Deferrals
 
This is a FiveM resources that allows developers to easily create server-side adaptive cards within deferrals using Microsoft Adaptive Cards.

Within one of the FiveM Cookbook topics about the use of [Adaptive Cards in deferrals](https://cookbook.fivem.net/2019/06/29/adaptive-cards-in-deferrals/), it shows a code example of how an adaptive card would work when a player connects to a server:
```lua
AddEventHandler('playerConnecting', function(name, skr, d)
    d.defer()
    Wait(50)
    -- badly serialized JSON in a string, from the Adaptive Cards designer
    d.presentCard([==[{"type":"AdaptiveCard","body":[{"type":"TextBlock","size":"ExtraLarge","weight":"Bolder","text":"Server password?!"},{"type":"TextBlock","text":"That's right, motherfucker! You have to enter a goddamn PASSWORD to connect to this server...","wrap":true},{"type":"Input.Text","id":"password","title":"","placeholder":"better enter one now"},{"type":"Image","url":"http://images.amcnetworks.com/ifccenter.com/wp-content/uploads/2019/04/pulpfic_1280.jpg","altText":""},{"type":"ActionSet","actions":[{"type":"Action.Submit","title":"Sure..."},{"type":"Action.ShowCard","title":"YOU WISH!!!!!!","card":{"type":"AdaptiveCard","body":[{"type":"Image","url":"https://i.imgur.com/YjMR0E6.jpg","altText":""}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}}]}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json","version":"1.0"}]==],
        function(data, rawData)
            -- you can chain cards, this is just the example adaptive card in the designer
            d.presentCard([==[{"type":"AdaptiveCard","body":[{"type":"Container","items":[{"type":"TextBlock","size":"Medium","weight":"Bolder","text":"Publish Adaptive Card schema"},{"type":"ColumnSet","columns":[{"type":"Column","items":[{"type":"Image","style":"Person","url":"https://pbs.twimg.com/profile_images/3647943215/d7f12830b3c17a5a9e4afcc370e3a37e_400x400.jpeg","size":"Small"}],"width":"auto"},{"type":"Column","items":[{"type":"TextBlock","weight":"Bolder","text":"Matt Hidinger","wrap":true},{"type":"TextBlock","spacing":"None","text":"Created {{DATE(2017-02-14T06:08:39Z,SHORT)}}","isSubtle":true,"wrap":true}],"width":"stretch"}]}]},{"type":"Container","items":[{"type":"TextBlock","text":"Now that we have defined the main rules and features of the format, we need to produce a schema and publish it to GitHub. The schema will be the starting point of our reference documentation.","wrap":true},{"type":"FactSet","facts":[{"title":"Board:","value":"Adaptive Card"},{"title":"List:","value":"Backlog"},{"title":"Assigned to:","value":"Matt Hidinger"},{"title":"Due date:","value":"Not set"}]}]}],"actions":[{"type":"Action.ShowCard","title":"Set due date","card":{"type":"AdaptiveCard","body":[{"type":"Input.Date","id":"dueDate"},{"type":"Input.Text","id":"comment","placeholder":"Add a comment","isMultiline":true}],"actions":[{"type":"Action.Submit","title":"OK","url":"http://adaptivecards.io"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}},{"type":"Action.Submit","title":"View","url":"http://adaptivecards.io"}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json","version":"1.0"}]==],
                function(_, rawData2)
                    -- normally you'd check the password, also submit button IDs are sent as submitId
                    -- we're lazy so just reject everyone and tell them the password
                    d.done('you suck actually for entering the password: ' .. data.password .. ' and data like ' .. rawData2)
                end)
        end)
end)
```

This example is large and a bit of a pain to read through. So I created a library of exports that developers can use to create Adaptive Cards within server-side scripts using export functions instead of writing Adaptive Cards from raw JSON.

Using this resource, the previous code example becomes the following:
```lua
AddEventHandler('playerConnecting', function(name, skr, d)
    d.defer()
    Wait(50)
    local cardOne = DeferralCards:CreateAdaptiveCard({
        body = {
            DeferralCards:CreateTextBlock({
                size = 'ExtraLarge',
                weight = 'Bolder',
                text = 'Server password?!'
            }),
            DeferralCards:CreateTextBlock({
                text = "That's right, motherfucker! You have to enter a goddamn PASSWORD to connect to this server...",
                wrap = true
            }),
            DeferralCards:CreateTextInput({
                id = 'password',
                title = '',
                placeholder = 'better enter one now'
            }),
            DeferralCards:CreateImage({
                url = 'http://images.amcnetworks.com/ifccenter.com/wp-content/uploads/2019/04/pulpfic_1280.jpg',
                altText = ''
            }),
            DeferralCards:CreateActionSet({
                actions = {
                    DeferralCards:CreateSubmitAction({
                        title = 'Sure...'
                    }),
                    DeferralCards:CreateShowCardAction({
                        title = 'YOU WISH!!!!!!',
                        card = DeferralCards:CreateAdaptiveCard({
                            body = {
                                DeferralCards:CreateImage({
                                    url = 'https://i.imgur.com/YjMR0E6.jpg',
                                    altText = ''
                                })
                            }
                        })
                    })
                }
            })
        }
    })
    d.presentCard(cardOne, function(data, rawData)
        local cardTwo = DeferralCards:CreateAdaptiveCard({
            body = {
                DeferralCards:CreateContainer({
                    items = {
                        DeferralCards:CreateTextBlock({
                            size = 'Medium',
                            weight = 'Bolder',
                            text = 'Publish Adaptive Card schema'
                        }),
                        DeferralCards:CreateColumnSet({
                            columns = {
                                DeferralCards:CreateColumn({
                                    items = {
                                        DeferralCards:CreateImage({
                                            style = 'Person',
                                            url = 'https://pbs.twimg.com/profile_images/3647943215/d7f12830b3c17a5a9e4afcc370e3a37e_400x400.jpeg',
                                            size = 'Small'
                                        })
                                    },
                                    width = 'auto'
                                }),
                                DeferralCards:CreateColumn({
                                    items = {
                                        DeferralCards:CreateTextBlock({
                                            weight = 'Bolder',
                                            text = 'Matt Hidinger',
                                            wrap = true
                                        }),
                                        DeferralCards:CreateTextBlock({
                                            spacing = 'None',
                                            text = 'Created {{DATE(2017-02-14T06:08:39Z,SHORT)}}',
                                            isSubtle = true,
                                            wrap = true
                                        })
                                    },
                                    width = 'stretch'
                                })
                            }
                        })
                    }
                }),
                DeferralCards:CreateContainer({
                    items = {
                        DeferralCards:CreateTextBlock({
                            text = 'Now that we have defined the main rules and features of the format, we need to produce a schema and publish it to GitHub. The schema will be the starting point of our reference documentation.',
                            wrap = true
                        }),
                        DeferralCards:CreateFactSet({
                            facts = {
                                DeferralCards:CreateFact({
                                    title = 'Board:',
                                    value = 'Adaptive Card'
                                }),
                                DeferralCards:CreateFact({
                                    title = 'List:',
                                    value = 'Backlog'
                                }),
                                DeferralCards:CreateFact({
                                    title = 'Assigned to:',
                                    value = 'Matt Hidinger'
                                }),
                                DeferralCards:CreateFact({
                                    title = 'Due date:',
                                    value = 'Not set'
                                })
                            }
                        })
                    }
                })
            },
            actions = {
                DeferralCards:CreateShowCardAction({
                    title = 'Set due date',
                    card = DeferralCards:CreateAdaptiveCard({
                        body = {
                            DeferralCards:CreateDateInput({
                                id = 'dueDate'
                            }),
                            DeferralCards:CreateTextInput({
                                title = 'comment',
                                placeholder = 'Add a comment',
                                isMultiline = true
                            })
                        },
                        actions = {
                            DeferralCards:CreateSubmitAction({
                                title = 'OK',
                                url = 'http://adaptivecards.io'
                            })
                        }
                    })
                }),
                DeferralCards:CreateSubmitAction({
                    title = 'View',
                    url = 'http://adaptivecards.io'
                })
            }
        })
        d.presentCard(cardTwo, function(_, rawData2)
            d.done('you suck actually for entering the password: ' .. data.password .. ' and data like ' .. rawData2)
        end)
    end)
end)
```

This example looks a lot cleaner and easier to read through.

# Important
From my personal experience, it is advised to use these export functions within a while true loop otherwise the client will timeout after a couple of seconds.

# Exports

Function Name | Options
------------ | -------------
CreateAdaptiveCard | https://adaptivecards.io/explorer/AdaptiveCard.html
CreateTextBlock | https://adaptivecards.io/explorer/TextBlock.html
CreateImage | https://adaptivecards.io/explorer/Image.html
CreateMedia | https://adaptivecards.io/explorer/Media.html
CreateMediaSource | https://adaptivecards.io/explorer/MediaSource.html
CreateRichTextBlockItem | `<string>` text<br/> `<string?>` size<br/> `<string?>` color<br/> `<boolean?>` isSubtle<br/> `<string?>` weight<br/> `<boolean?>` highlight<br/> `<boolean?>` italic<br/> `<boolean?>` strikethrough<br/> `<string?>` fontType<br/>
CreateRichTextBlock | https://adaptivecards.io/explorer/RichTextBlock.html
CreateTextRun | https://adaptivecards.io/explorer/TextRun.html
CreateActionSet | https://adaptivecards.io/explorer/ActionSet.html
CreateContainer | https://adaptivecards.io/explorer/Container.html
CreateColumnSet | https://adaptivecards.io/explorer/ColumnSet.html
CreateColumn | https://adaptivecards.io/explorer/Column.html
CreateFact | https://adaptivecards.io/explorer/Fact.html
CreateFactSet | https://adaptivecards.io/explorer/FactSet.html
CreateImageSetItem | `<string>` type<br/> `<string>` url
CreateImageSet | https://adaptivecards.io/explorer/ImageSet.html
CreateOpenUrlAction | https://adaptivecards.io/explorer/Action.OpenUrl.html
CreateSubmitAction | https://adaptivecards.io/explorer/Action.Submit.html
CreateShowCardAction | https://adaptivecards.io/explorer/Action.ShowCard.html
CreateTargetElement | https://adaptivecards.io/explorer/TargetElement.html
CreateToggleVisibilityAction | https://adaptivecards.io/explorer/Action.ToggleVisibility.html
CreateExecuteAction | https://adaptivecards.io/explorer/Action.Execute.html
CreateTextInput | https://adaptivecards.io/explorer/Input.Text.html
CreateNumberInput | https://adaptivecards.io/explorer/Input.Number.html
CreateDateInput | https://adaptivecards.io/explorer/Input.Date.html
CreateTimeInput | https://adaptivecards.io/explorer/Input.Time.html
CreateToggleInput | https://adaptivecards.io/explorer/Input.Toggle.html
CreateChoice | https://adaptivecards.io/explorer/Input.Choice.html
CreateChoiceSet | https://adaptivecards.io/explorer/Input.ChoiceSet.html

# Links
[Microsoft Adaptive Cards documentation](https://adaptivecards.io/explorer/)
