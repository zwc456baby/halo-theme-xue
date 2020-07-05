<#include "module/macro.ftl">
<@layout title="友情链接 | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}">
    <main class="mx-auto">
        <header class="bg-cover post-cover">
            <#if settings.links_patternimg?? && settings.links_patternimg!=''>
                <div class="w-screen cover-bg">
                    <img src="${settings.links_patternimg!}" class="z-auto"
                         alt="${settings.links_title!'Friends'}">
                </div>
            <#else>
                <div class="placeholder-bg">
                </div>
            </#if>
            <div class="cover-content">
                <!-- 封面内容 -->
                <div class="inner flex flex-col justify-center">
                    <h2 class="slogan text-center">${settings.links_title!'Friends'}</h2>
                </div>
            </div>
        </header>
        <div class="container mx-auto px-4 mt-16 max-w-6xl tracking-wider md:leading-relaxed sm:leading-normal ct-container cn-pd">
            <@linkTag method="listTeams">
                <#list teams as item>
                    <#if item.team?? && item.team!=''>
                        <h2 class="w-full m-4 text-3xl">${item.team}</h2>
                    </#if>
                    <div class="flex flex-row flex-wrap grid lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-1">
                        <#list item.links?sort_by('priority')?reverse  as link>
                            <a class="lk-card-im card-item-vel block" href="${link.url}" target="_blank"
                               onfocus="this.blur();">
                                <div class="media">
                                    <div class="media-left">
                                        <figure class="image is-64x64">
                                            <#if link.logo?? && link.logo != ''>
                                                <img src="${link.logo}" alt="${link.name}">
                                            <#elseif settings.links_placeholder?? && settings.links_placeholder != ''>
                                                <img src="${settings.links_placeholder}"
                                                     alt="${link.name}">
                                            <#else>
                                                <img src="https://cdn.jsdelivr.net/gh/hshanx/static@v1.0.1/placeholder.jpg"
                                                     alt="${link.name}">
                                            </#if>
                                        </figure>
                                    </div>
                                    <div class="media-content">
                                        <p class="lk-title">${link.name}</p>
                                        <p class="lk-desc">${link.description}</p>
                                    </div>
                                </div>
                            </a>
                        </#list>
                    </div>
                </#list>
            </@linkTag>
        </div>
    </main>
</@layout>
