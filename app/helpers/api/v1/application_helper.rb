module Api
    module V1
        module ApplicationHelper
            # def auth_url(user = nil)
            #     # TODO recommended to log 'user' info for debugging
            #     "/auth/signin"
            # end

            def root_path(*_params)
                api_v1_root_path(_params)
            end
        end
    end
end
