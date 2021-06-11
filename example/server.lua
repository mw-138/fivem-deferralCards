DeferralCards = exports['fivem-deferralCards']

AddEventHandler('playerConnecting', function(pName, pKickReason, pDeferrals)
    local src = source
    
    pDeferrals.defer()
    
    Citizen.Wait(1000)
    
    while true do
        local card = DeferralCards:CreateAdaptiveCard({
            body = {
                DeferralCards:CreateContainer({
                    items = {
                        DeferralCards:CreateImage({
                            url = 'https://lh3.googleusercontent.com/proxy/ircc9N-TqIgSD1fkQrDZIlUVAJ0ss9immpQDuZ2dttQ6GxJ1gxAnOOV700FAVVmBhRQelnnkIDd6YQt5B-X4',
                            size = 'small',
                            horizontalAlignment = 'center'
                        }),
                        DeferralCards:CreateTextBlock({
                            text = ('Welcome, %s'):format(pName),
                            weight = 'Light',
                            horizontalAlignment = 'center'
                        }),
                        DeferralCards:CreateActionSet({
                            actions = {
                                DeferralCards:CreateSubmitAction({
                                    id = 'submit_join',
                                    title = 'Join'
                                })
                            }
                        })
                    },
                    isVisible = true
                })
            },
        }

        pDeferrals.presentCard(card), function(pData, pRawData)
            if pData.submitId == 'submit_join' then
                pDeferrals.update('✅ Connecting to server...')
                Citizen.Wait(1000)
                pDeferrals.done()
                print(('%s is connecting to the server'):format(pName))
            end
        end)

        Citizen.Wait(1000)
    end
end)