<template>
	<div>
		<el-button
			type="primary"
			@click="notification"
		>Primary</el-button>
	</div>
	<div class="grid grid-cols-1 gap-2 ">
		<div class=" border rounded bg-gray-50">
			<div class="flex flex-col  ">
				<div
					class="m-2"
					v-if="showSuccess"
				>
					<el-alert
						title="success alert"
						type="success"
						show-icon
					/>
				</div>
				<div
					class="m-2"
					v-if="showInfo"
				>
					<el-alert
						title="info alert"
						type="info"
						show-icon
					/>
				</div>
				<!-- <el-alert
					title="warning alert"
					type="warning"
					show-icon
				/>
				<el-alert
					title="error alert"
					type="error"
					show-icon
				/> -->
				<el-table
					:data="tableData"
					style="width: 100%"
				>
					<el-table-column
						type="selection"
						width="55"
					/>
					<el-table-column
						label="Date"
						width="120"
					>
						<template #default="scope">{{ scope.row.date }}</template>
					</el-table-column>
					<el-table-column
						property="name"
						label="Name"
						width="120"
					/>
					<el-table-column
						property="address"
						label="Address"
						show-overflow-tooltip
					/>
				</el-table>
			</div>
		</div>
	</div>
</template>
<script>
export default {
	components: {},
	data() {
		const tableData = [
			{
				date: '2016-05-03',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-02',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-04',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-01',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-08',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-06',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
			{
				date: '2016-05-07',
				name: 'Tom',
				state: 'California',
				city: 'Los Angeles',
				address: 'No. 189, Grove St, Los Angeles',
				zip: 'CA 90036',
			},
		]
		return {
			tableData,
			showSuccess: false,
			showInfo: false
		}
	},
	computed: {

	},

	mounted() {

	},
	methods: {
		notification() {
			this.showSuccess = !this.showSuccess
			ElNotification.success({
				title: 'Success',
				message: 'This is a success message',
				offset: 100,
			})
			ElMessage({
				message: 'Congrats, this is a success message.',
				type: 'success',
			})
		}
	}
}
</script>
<style scoped>
:global(h2#card-usage ~ .example .example-showcase) {
	background-color: var(--el-fill-color) !important;
}

.el-statistic {
	--el-statistic-content-font-size: 28px;
}

.statistic-card {
	height: 100%;
	padding: 20px;
	border-radius: 4px;
	background-color: var(--el-bg-color-overlay);
}

.statistic-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
	flex-wrap: wrap;
	font-size: 12px;
	color: var(--el-text-color-regular);
	margin-top: 16px;
}

.statistic-footer .footer-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.statistic-footer .footer-item span:last-child {
	display: inline-flex;
	align-items: center;
	margin-left: 4px;
}

.green {
	color: var(--el-color-success);
}
.red {
	color: var(--el-color-error);
}
</style>