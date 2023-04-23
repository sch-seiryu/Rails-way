# Rails-way
Practicing 'Ruby on Rails' with a given simple assignment.

## Git branch 'dev1a' announcement
* In this branch, trying to use Rails' default features and development tools, such as 'resourceful routing', rather than fitting into the API specification directly, which causes lots of troubles here, to build up a properly functional web app. <br>
Especially struggling with the 'authentication' issues currently, I'm going to follow instructions of the link below - an exercise about to build a fully functional web site with a user auth feature from scratch, instead of using typical auth libs, to understand how a authentication works in Rails.
> https://stevepolito.design/blog/rails-authentication-from-scratch
* Skipping some earlier parts of the reference related with DB/ORM, starting from step 6.
> https://stevepolito.design/blog/rails-authentication-from-scratch#step-6-create-current-model-and-authentication-concern
* There's ... '[G2Step7]<Override>' which means 'It is overridden that the Step 7 of Guide number 2, being '. The guide number 2 is the reference just above, the main article of this branch.
* Skiping G2's (including of some part of the step 8 and step 12) step 9 through step 11, and step 13 through 16, as I don't need features like email confirmation, user management, password reset, and remembering password. Going to step 18, after dropping by step 17.(also ignoring 'Account for Timing Attacks' of step 17, as I use Rails version 7.0.x, not 7.1; note that currently there's two sections with same numbering, 'step 17')
* Before proceeding to step 18, as there's going to modify models in the step 18, leaving a commit prior making some differences.
* This is comment block template sample, to identify that the codes have been appended, overridden, or updated from the earlier steps.
> 
````
# [G2Step]<Append>~ 
# ~[G2Step]<Append>
````
* @2023-04-22 19:39:12
    * 이제 로그인과 로그인한 독립된, 혹은 모든 세션 로그아웃 가능해짐. Session이 제대로 구성된게 중요하고 DB랑 연동도 되어있으며, 권한과 관련해선 아직 제대로 측정 못했지만 내장된 방법들을 경우에 따라선 수동으로 이어주면서(주로 helper에서 versioning 되지 않은 명칭들을 versioning 들어간 유효한 주소로 바꿔주는 작업을 했다. 여기서 처리하면 view 등에는 버전 무관하게 깨끗하게 보여줄 수 있기 때문.) 온전하게 동작하게 했다. 이번 개발 사이클의 핵심은 로그인과 로그아웃이었고, 그걸 위해 기본적인 Session 기능을 이용했다. 별도의 보안 장치(최소한 비밀번호와 관련된 BCrypt 및 has_secure_password)는 모두 배제해둔 상태로 단계적인 적용을 해갈 생각이다. 일부로 이 과정이 없는 가능한한 컴팩트한 구성을 달성하는게 목적이었기 때문에 SSL 정도를 제외한 어떤 보안 관련 도구도 사용하지 않으려고 했다.
    * 이제 커밋 하고 메인 브랜치로도 1회성 푸시갈 생각(이전 커밋 안 따라오게 Git 좀 더 배워서 할 것)
    * 내용은 정리해서 커밋할 때 붙일것. -> 굳이 바꿀 필요 있겠나
    * 대신에 다른 세부 기능들을 정상화시키고 버릴 코드들은 버린 다음 클린한 버전을 main 브랜치에 push하자.
    * 그리고 하나 더하자면, resourceful routing이 상당히 편리해서 다른 controller의 영역에 있는 기능 등도 비교적 편하게 호출 가능하다. 예를 들어 현재 root 페이지인 contents#index 템플릿에, 접속중인 유저를 표시하고 로그아웃을 수행하는 버튼을 삽입할 수 있었다. 굳이 User 페이지 같은걸 만들어서 이동한 다음, 해당 하위 페이지에서나 관련된 controller를 호출해 계정 로그인과 로그아웃을 진행하거나 하지 않아도 된단 얘기다. 덤으로 session 기반이라, session control을 하는 것으로 불필요한 노동을 줄일 수 있다.

===

## FURTHER NOTICE
* To read dev notes, see 'RailsTest_Note.md' in 'dev1' branch; it contains TMI.

## Current State
* Project has been initialized through *Ruby on Rails*
    * confirmed its server is working over *Puma* on 'localhost:3000'
* [InProgress] Route paths and generate controllers
* [Next] Make records/models/entities and migrate DB


## Model
* Generate User and Content models via console (Windows); it seems there's no specific field type for an email neither password, simply use 'string' type for those fields.
> ruby bin/rails generate model User firstName:string lastName:string email:string password:string country:string
> ruby bin/rails generate model Content title:string body:text user:references
* Also, following commands had been used to make controllers.
> ruby bin/rails generate controller Users sign_up sign_in --skip-routes
> ruby bin/rails generate controller Contents create get update delete --skip-routes

## ... 
* Currently working features:
*NOTE - The features has been tested on web browsers, not on POSTMAN; I'll explain the reason why later*
    * sign up
    * sign in; templates only - controller is still struggling
    * content(index); new content can be written, but it'd be failed to be stored in DB, so unable to see it again on 'content'page

* Here's the journey
    * Ruby와 Ruby on Rails가 무엇인지 검색
    * 노트북에 Rails 튜토리얼을 따라 환경 구성
    * controller와 model을 generate 하고, routes.rb에서 POSTMAN specification에 있는 여섯가지 주요 HTTP request에 대한 매핑 진행.
    * 튜토리얼을 참고하며 controller단에서 테스트 도중 경로와 auth 문제 발생.
    * 경로 문제(...api/v1...)의 경우 대부분의 기능은 namespace를 이용하면서 해결됐으나, view와 controller에서의 model 접근을 어렵게 만듦.(한쪽을 해결하면 다른쪽에서 문제가 생김)
    * 인증(auth) 관련 문제는 주로 'Unpermitted parameter error'를 발생시키면서 controller쪽에서 검열됐다. 'params' hash에 대한 조작을 익히면서 당장 ActiveRecord를 생성하는 데는 문제가 없었으나, JWT/O2Auth를 써서 유저를 특정하는 과정이나, basic/bearer token을 이용해서 보안절차를 수행하거나 POSTMAN의 예제를 수행하기 위해서는 더 많은 작업이 필요해보였고, 앞서 언급한 경로 문제 등으로 인한 프레임워크의 비정상적인 형태가 문제 해결을 어렵게 함.
    * 이와 같은 문제가 발생한 가장 큰 이유는 튜토리얼은 API versioning을 고려하지 않고 진행했고, auth에 관해서도 아주 짤막하게 다루고 있기 때문이다. 심지어 CSRF 대응을 위해서지, 인증된 사용자를 위한 것도 아니다. 그런 이유로 초기 진행은 수월했으나 이후 view와 연동하는 부분에서부터 자잘한 버그가 생겼고, 그것을 해결하기 위해 여러 부분을 동시다발적으로 손대다 보니 프로젝트 전체를 손볼 필요성이 있어 시간 소모를 기약할 수 없게 됐다.(현재)
    * POSTMAN collection의 예제들은 아마 대부분 성공하지 못할 것입니다. 경로 문제와 인증 문제 때문에 POSTMAN이 아닌 브라우저에서 view를 이용해가며 테스트한 경우가 많았고, 아예 api만 있는 어플리케이션을 생성할 수 있다는 것도 나중에 알게됐습니다. 아무래도 백엔드 전문 개발자가 아니었기 때문에 발생한 오류라고 생각됩니다. Ruby 및 기타 관련 도구들에 대해서도 지식이 전무했던 점도 컸던것 같습니다. 이후 본 프로젝트는 toy project의 형태로 계속 개선 등을 거쳐, 제시된 API spec뿐만 아니라, fully functional한 형태로 키워나가려고 합니다.

    # About 'contents' part.
    * temporary test data (as I know, it can also be set up using '/db/seeds.rb')
    > INSERT INTO 
    contents(title, body, user_id, created_at, updated_at)
VALUES
    ('First Article', 'First body\nAnd First body''s second line.', 15, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);