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

            def content_path(content = nil, args = nil)
                # if args
                #     puts "[INFO] further args caught:", "\n\tcontent", content, "\n\targs:", args, "\n"
                # end
                # # 이거면 view(template)에서 굳이 API versioning된 경로를 써주지 않아도 되려나
                # # -> 이러지 않아도 원래 작성된 파일에 접근하는 건 문제가 없다. 지난번 user_helper 관련 해결 방안으로 쓰였던거 같은 그거랑은 다른 문제인 듯하다.
                # if content
                #     "/contents/#{content.id}"
                # else
                #     ""
                # end
            end

            # def edit_2_content_path(args = nil)
            def edit_content_path(args = nil)
                if args  # TODO check instance type
                    "/api/v1/contents/#{args.id}"
                else
                    "/api/v1/contents/"
                end
            end

            def content_2_path(args = nil)
                "/api/v1/contents/#{args}"
            end

            def auth_url(user = nil)
                # TODO recommended to log 'user' info for debugging
                "/auth/signin"
            end
        end
    end
end
