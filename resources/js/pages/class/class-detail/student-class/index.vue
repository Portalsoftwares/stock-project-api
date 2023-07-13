<template>
	<!-- <div class="mt-5 bg-white p-5"> -->
	<div>
		<div class="text-left text-md font-bold pb-2 ">បញ្ជីឈ្មោះសិស្ស</div>
	</div>
	<el-table
		:data="data"
		header-cell-class-name="sanfont-khmer text-md"
		row-class-name="sanfont-khmer"
		stripe
	>
		<el-table-column
			label="ID"
			type="index"
		></el-table-column>
		<el-table-column label="ឈ្មោះសិស្ស">
			<template #default="scope">
				<span>
					{{ scope.row.student_in_class.first_name_kh }} {{ scope.row.student_in_class.last_name_kh }}
				</span>
			</template>
		</el-table-column>
		<el-table-column label="ថ្ងៃខែឆ្នាំកំណើត">
			<template #default="scope">
				<span>
					01-06-2020
				</span>
			</template>
		</el-table-column>
		<el-table-column label="ស្ថានភាព">
			<template #default="scope">
				<span class="text-blue-500">
					កំពុងសិក្សា
				</span>
			</template>
		</el-table-column>
	</el-table>
	<!-- </div> -->
</template>
<script>
export default {
	props: {
		data: Object
	},
	created() {
		this.studentClass = this.$props.data
	},
	data() {
		return {
			studentClass: []
		}
	},
	methods: {

	}
}
</script>