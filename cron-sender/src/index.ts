/**
 * Welcome to Cloudflare Workers!
 *
 * This is a template for a Scheduled Worker: a Worker that can run on a
 * configurable interval:
 * https://developers.cloudflare.com/workers/platform/triggers/cron-triggers/
 *
 * - Run `npm run dev` in your terminal to start a development server
 * - Run `curl "http://localhost:8787/__scheduled?cron=*+*+*+*+*"` to see your Worker in action
 * - Run `npm run deploy` to publish your Worker
 *
 * Bind resources to your Worker in `wrangler.jsonc`. After adding bindings, a type definition for the
 * `Env` object can be regenerated with `npm run cf-typegen`.
 *
 * Learn more at https://developers.cloudflare.com/workers/
 */

export default {
  async scheduled(event, env, ctx): Promise<void> {
    const repo = "chika3742/genshin_material"
    const workflowId = "pubreform.yml"
    const result = await fetch(`https://api.github.com/repos/${repo}/actions/workflows/${workflowId}/dispatches`, {
      method: "POST",
      headers: {
        "Accept": "application/vnd.github+json",
        "Authorization": `Bearer ${env.GITHUB_TOKEN}`,
        "User-Agent": "cron-sender(https://github.com/chika3742)"
      },
      body: JSON.stringify({
        ref: "main",
      }),
    })
    if (result.ok) {
      console.log("Success")
    } else {
      console.error(await result.text())
      throw new Error("API returned a non-ok status code")
    }
  },
} satisfies ExportedHandler<Env>;
