module Api
    module V1
        module ApplicationHelper

            def auth_url(user = nil)
                # TODO recommended to log 'user' info for debugging
                "/auth/signin"
            end

        end
    end
end
