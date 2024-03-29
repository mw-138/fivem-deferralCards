# FiveM Adaptive Cards For Deferrals

Original Post: https://forum.cfx.re/t/fivem-adaptive-cards-in-deferrals/3313726?u=mw138
 
This is a FiveM resource that allows developers to easily create server-side adaptive cards within deferrals using Microsoft Adaptive Cards.

Within one of the FiveM Cookbook topics about the use of [Adaptive Cards in deferrals](https://cookbook.fivem.net/2019/06/29/adaptive-cards-in-deferrals/), it shows a code example of how an adaptive card would work when a player connects to a server:
```lua
AddEventHandler('playerConnecting', function(name, skr, d)
    d.defer()
    Wait(50)
    -- badly serialized JSON in a string, from the Adaptive Cards designer
    d.presentCard([==[{"type":"AdaptiveCard","body":[{"type":"TextBlock","size":"ExtraLarge","weight":"Bolder","text":"Server password?!"},{"type":"TextBlock","text":"That's right! You have to enter a goddamn PASSWORD to connect to this server...","wrap":true},{"type":"Input.Text","id":"password","title":"","placeholder":"better enter one now"},{"type":"Image","url":"http://images.amcnetworks.com/ifccenter.com/wp-content/uploads/2019/04/pulpfic_1280.jpg","altText":""},{"type":"ActionSet","actions":[{"type":"Action.Submit","title":"Sure..."},{"type":"Action.ShowCard","title":"YOU WISH!!!!!!","card":{"type":"AdaptiveCard","body":[{"type":"Image","url":"https://i.imgur.com/YjMR0E6.jpg","altText":""}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json"}}]}],"$schema":"http://adaptivecards.io/schemas/adaptive-card.json","version":"1.0"}]==],
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

This example is large and a bit of a pain to read through. So I created a library of exports that developers can use to create Adaptive Cards within server-side scripts using functions instead of writing in raw JSON.

Using this resource, the previous code example becomes the following:
```lua
AddEventHandler('playerConnecting', function(name, skr, d)
    d.defer()
    Wait(50)
    local cardOne = DeferralCards.Card:Create({
        body = {
            DeferralCards.CardElement:TextBlock({
                size = 'ExtraLarge',
                weight = 'Bolder',
                text = 'Server password?!'
            }),
            DeferralCards.CardElement:TextBlock({
                text = "That's right! You have to enter a goddamn PASSWORD to connect to this server...",
                wrap = true
            }),
            DeferralCards.Input:Text({
                id = 'password',
                title = '',
                placeholder = 'better enter one now'
            }),
            DeferralCards.CardElement:Image({
                url = 'http://images.amcnetworks.com/ifccenter.com/wp-content/uploads/2019/04/pulpfic_1280.jpg',
                altText = ''
            }),
            DeferralCards.Container:ActionSet({
                actions = {
                    DeferralCards.Action:Submit({
                        title = 'Sure...'
                    }),
                    DeferralCards.Action:ShowCard({
                        title = 'YOU WISH!!!!!!',
                        card = DeferralCards.Card:Create({
                            body = {
                                DeferralCards.CardElement:Image({
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
        local cardTwo = DeferralCards.Card:Create({
            body = {
                DeferralCards.Container:Create({
                    items = {
                        DeferralCards.CardElement:TextBlock({
                            size = 'Medium',
                            weight = 'Bolder',
                            text = 'Publish Adaptive Card schema'
                        }),
                        DeferralCards.Container:ColumnSet({
                            columns = {
                                DeferralCards.Container:Column({
                                    items = {
                                        DeferralCards.CardElement:Image({
                                            style = 'Person',
                                            url = 'https://pbs.twimg.com/profile_images/3647943215/d7f12830b3c17a5a9e4afcc370e3a37e_400x400.jpeg',
                                            size = 'Small'
                                        })
                                    },
                                    width = 'auto'
                                }),
                                DeferralCards.Container:Column({
                                    items = {
                                        DeferralCards.CardElement:TextBlock({
                                            weight = 'Bolder',
                                            text = 'Matt Hidinger',
                                            wrap = true
                                        }),
                                        DeferralCards.CardElement:TextBlock({
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
                DeferralCards.Container:Create({
                    items = {
                        DeferralCards.CardElement:TextBlock({
                            text = 'Now that we have defined the main rules and features of the format, we need to produce a schema and publish it to GitHub. The schema will be the starting point of our reference documentation.',
                            wrap = true
                        }),
                        DeferralCards.Container:FactSet({
                            facts = {
                                DeferralCards.Container:Fact({
                                    title = 'Board:',
                                    value = 'Adaptive Card'
                                }),
                                DeferralCards.Container:Fact({
                                    title = 'List:',
                                    value = 'Backlog'
                                }),
                                DeferralCards.Container:Fact({
                                    title = 'Assigned to:',
                                    value = 'Matt Hidinger'
                                }),
                                DeferralCards.Container:Fact({
                                    title = 'Due date:',
                                    value = 'Not set'
                                })
                            }
                        })
                    }
                })
            },
            actions = {
                DeferralCards.Action:ShowCard({
                    title = 'Set due date',
                    card = DeferralCards.Card:Create({
                        body = {
                            DeferralCards.Input:Date({
                                id = 'dueDate'
                            }),
                            DeferralCards.Input:Text({
                                title = 'comment',
                                placeholder = 'Add a comment',
                                isMultiline = true
                            })
                        },
                        actions = {
                            DeferralCards.Action:Submit({
                                title = 'OK',
                                url = 'http://adaptivecards.io'
                            })
                        }
                    })
                }),
                DeferralCards.Action:Submit({
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

This example looks a lot cleaner and easier to read through. With this running in a while loop, you can use variables to dynamically change how the adaptive card functions. For example, you can create a queue interface and show the player's position in the queue etc.

# How To Use
To use this resource, you can use the export functions listed below to help create Adaptive Cards.

# Important
Not sure if this is intentional, but whenever you do not use adaptive cards in a while loop, the client will get a connection failed prompt. Another thing to mention is that some export functions that require input from the client such as text input or date input will not work as the loop will reset the state of the inputs.

# Exports
Function Name | Options
------------ | -------------
DeferralCards.Card:Create | https://adaptivecards.io/explorer/AdaptiveCard.html
DeferralCards.CardElement:TextBlock | https://adaptivecards.io/explorer/TextBlock.html
DeferralCards.CardElement:Image | https://adaptivecards.io/explorer/Image.html
DeferralCards.CardElement:Media | https://adaptivecards.io/explorer/Media.html
DeferralCards.CardElement:MediaSource | https://adaptivecards.io/explorer/MediaSource.html
DeferralCards.CardElement:RichTextBlockItem | `<string>` text<br/> `<string?>` size<br/> `<string?>` color<br/> `<boolean?>` isSubtle<br/> `<string?>` weight<br/> `<boolean?>` highlight<br/> `<boolean?>` italic<br/> `<boolean?>` strikethrough<br/> `<string?>` fontType<br/>
DeferralCards.CardElement:RichTextBlock | https://adaptivecards.io/explorer/RichTextBlock.html
DeferralCards.CardElement:TextRun | https://adaptivecards.io/explorer/TextRun.html
DeferralCards.Container:Create | https://adaptivecards.io/explorer/Container.html
DeferralCards.Container:ActionSet | https://adaptivecards.io/explorer/ActionSet.html
DeferralCards.Container:ColumnSet | https://adaptivecards.io/explorer/ColumnSet.html
DeferralCards.Container:Column | https://adaptivecards.io/explorer/Column.html
DeferralCards.Container:Fact | https://adaptivecards.io/explorer/Fact.html
DeferralCards.Container:FactSet | https://adaptivecards.io/explorer/FactSet.html
DeferralCards.Container:ImageSetItem | `<string>` type<br/> `<string>` url
DeferralCards.Container:ImageSet | https://adaptivecards.io/explorer/ImageSet.html
DeferralCards.Action:OpenUrl | https://adaptivecards.io/explorer/Action.OpenUrl.html
DeferralCards.Action:Submit | https://adaptivecards.io/explorer/Action.Submit.html
DeferralCards.Action:ShowCard | https://adaptivecards.io/explorer/Action.ShowCard.html
DeferralCards.Action:TargetElement | https://adaptivecards.io/explorer/TargetElement.html
DeferralCards.Action:ToggleVisibility | https://adaptivecards.io/explorer/Action.ToggleVisibility.html
DeferralCards.Action:Execute | https://adaptivecards.io/explorer/Action.Execute.html
DeferralCards.Input:Text | https://adaptivecards.io/explorer/Input.Text.html
DeferralCards.Input:Number | https://adaptivecards.io/explorer/Input.Number.html
DeferralCards.Input:Date | https://adaptivecards.io/explorer/Input.Date.html
DeferralCards.Input:Time | https://adaptivecards.io/explorer/Input.Time.html
DeferralCards.Input:Toggle | https://adaptivecards.io/explorer/Input.Toggle.html
DeferralCards.Input:Choice | https://adaptivecards.io/explorer/Input.Choice.html
DeferralCards.Input:ChoiceSet | https://adaptivecards.io/explorer/Input.ChoiceSet.html

# Links & Credits
[Microsoft Adaptive Cards](https://adaptivecards.io/)<br/>
[Microsoft Adaptive Cards Documentation](https://adaptivecards.io/explorer/)
