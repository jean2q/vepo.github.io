require 'rest-client'
require 'json'

module Jekyll
    class GithubTag < Liquid::Tag
        def initialize(tag_name, repo, tokens)
            super
            repo = repo.start_with?('https://github.com/') ? repo[19..-1] : repo
            @repo_info = JSON.parse(::RestClient.get("https://api.github.com/repos/#{repo.strip}"))
            puts @repo_info
        end

        def render(context)
            output = <<~EOS
            <div class="github-repo">
                <h2>
                    <img class="logo" src="/assets/images/plugins/github-logo.png" alt="GitHub logo" loading="lazy" />
                    <img class="user" src="#{@repo_info["owner"]["avatar_url"]}" loading="lazy" />
                    <span class="url">
                        <a href="https://github.com/#{@repo_info["owner"]["login"]}">
                            #{@repo_info["owner"]["login"]}
                        </a> 
                        /
                        <a href="https://github.com/#{@repo_info["owner"]["login"]}/#{@repo_info["name"]}">
                            #{@repo_info["name"]}
                        </a>
                    </span>
                </h2>
            </div>
            EOS
        end
    end
end

Liquid::Template.register_tag('github', Jekyll::GithubTag)
