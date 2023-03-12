module Api
    module V1
        module ContentsHelper
            # 'users_helper.rb'로부터
            def contents_path(content = nil)
                unless content
                    "/models/content.rb"
                else
                    ""
                end
            end

            def new_content_path(args = nil)
                # "/contents/new"
                "/api/v1/contents/new"  # TODO what should I do to be without versioning path?
            end
        end
    end
end
