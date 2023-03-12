module Api
    module V1
        module UsersHelper
            def users_path(user = nil)
                unless user
                    "/models/user.rb"
                else
                    ""
                end
            end
            
            # TODO 이게 별개로 필요한건가?
            def user_path(user = nil)
                unless user
                    "/models/user.rb"
                else
                    ""
                end
            end

            def auth_url(user = nil)
                # TODO recommended to log 'user' info for debugging
                "/auth/signin"
            end
        end
    end
end
