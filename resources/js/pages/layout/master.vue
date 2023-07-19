<template>
	<div class="flex flex-row">
		<div class="flex w-full ">
			<Siade :dataSibar="isOpen"></Siade>
			<div
				:class="isOpen==false? 'w-full': ' w-[calc(100vw-250px)]'"
				class="transaction-width"
			>
				<Header :toggleSideBar="clickToggle"></Header>
				<div
					class="bg-slate-100 h-full overflow-y-auto px-4 pt-4 w-auto"
					style="height: calc(100vh - 3rem)"
				>
					<router-view />
				</div>
			</div>
		</div>
	</div>
</template>
<script>
import Siade from "./../../components/sidebar.vue";
import Header from "./../../components/header.vue";
export default {
	components: { Siade, Header },
	data() {
		return {
			isOpen: true
		}
	},
	methods: {
		clickToggle() {
			this.isOpen = !this.isOpen
		}
	}
};
</script>

<style>
</style>
