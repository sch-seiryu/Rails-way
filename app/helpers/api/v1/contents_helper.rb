module Api
    module V1
        module ContentsHelper
            include ApplicationHelper
            # extend Api::V1::ApplicationHelper
            
            # # 'users_helper.rb'로부터
            # def contents_path(content = nil)
            #     unless content
            #         "/models/content.rb"
            #     else
            #         ""
            #     end
            # end

            # def new_content_path(args = nil)
            #     # "/contents/new"
            #     "/api/v1/contents/new"  # TODO what should I do to be without versioning path?
            # end

            # # def content_path(content = nil, args = nil)
            # #     # if args
            # #     #     puts "[INFO] further args caught:", "\n\tcontent", content, "\n\targs:", args, "\n"
            # #     # end
            # #     # # 이거면 view(template)에서 굳이 API versioning된 경로를 써주지 않아도 되려나
            # #     # # -> 이러지 않아도 원래 작성된 파일에 접근하는 건 문제가 없다. 지난번 user_helper 관련 해결 방안으로 쓰였던거 같은 그거랑은 다른 문제인 듯하다.
            # #     # if content
            # #     #     "/contents/#{content.id}"
            # #     # else
            # #     #     ""
            # #     # end
            # # end

            # # def edit_2_content_path(args = nil)
            # def edit_content_path(args = nil)
            #     if args  # TODO check instance type
            #         "/api/v1/contents/#{args.id}"
            #     else
            #         "/api/v1/contents/"
            #     end
            # end

            # def content_2_path(args = nil)
            #     "/api/v1/contents/#{args}"
            # end

            # def auth_url(user = nil)
            #     # TODO recommended to log 'user' info for debugging
            #     "/auth/signin"
            # end



            # @2023-04-20 12:04:56
            # 내 생각에, 이건 BE 전용이라 View의 버저닝에 관련된 부분이 매끄럽지 않게 이어진게 아닌가 싶다.
            # 그래서 Template을 생성할 때, 기본적으론 model의 선언명을 기준으로 helper를 동작하지만,
            # versioning 등의 이유로 namespace 또는 module에 의해 중간 경로가 길어지는 경우
            # (resourceful routing시) helper method는 해당 경로를 반영한 경우에 맞춰 제공되지만,
            # view에서 template을 짜는 시점에서 controller와 helper에선 반영된 naming을 찾지 못해 
            # 문제가 생기는 것 같다. 기존 model의 naming을 따라가는데, 혹자는 view에 바뀐 helper method를 
            # 직접 넣기도 하지만, 나는 일단 여기 이 helper method에 alias의 느낌으로 routing table 상의 경로를 adapt 해주려고 한다.
            # 특정 객체명이나 어떤 힌트를 통해 일괄 변환되면 편할 텐데, 당장은 힌트를 얻지 못하겠다.
            # 어쩌면 view 쪽에서 ORM? 객체를 참조할 때 ... 애초에 model은 그대로네. 음... 좀 더 근본적인 해결책이 있을 것 같은데 일단 넘어가겠다.
            # ('form_with' 구문이라든가 쓰면 모르겠는데, 지금 애를 먹는 부분은 
            # '@contents.each do |content|' 형식으로 참조하고 있어서 파라미터가 좀 더 눈에 보이면 건드리겠는데 당장은 아는게 없어서 어떻게 하기가 어렵다)
            #
            # -> 와. 이게 되네.+캡쳐 @2023-04-20 12:25:33
            # def content_path(_format)
            #     api_v1_content_path(_format)
            def content_path(*_params)
                api_v1_content_path(_params)
            end

            def contents_path(*_params)
                api_v1_contents_path(_params)
            end

            def new_content_path(*_params)
                new_api_v1_content_path(_params)
            end

            def edit_content_path(*_params)
                edit_api_v1_content_path(_params)
            end
        end
    end
end
