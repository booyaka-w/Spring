package com.sorting.algorithm.code;

import java.util.Arrays;

public class SortingAlgorithm {

	/**
	 * 1，冒泡排序
	 * 
	 * @param array
	 * @return
	 */
	public static int[] bubbleSort(int[] array) {
		if (array.length == 0) {
			return array;
		}
		for (int i = 0; i < array.length; i++) {
			for (int j = 0; j < array.length - 1 - i; j++) {
				if (array[j + 1] < array[j]) {
					int temp = array[j + 1];
					array[j + 1] = array[j];
					array[j] = temp;
				}
			}
		}
		return array;
	}

	/**
	 * 2，选择排序
	 * 
	 * @param array
	 * @return
	 */
	public static int[] selectionSort(int[] array) {
		if (array.length == 0) {
			return array;
		}
		for (int i = 0; i < array.length; i++) {
			int minIndex = i;
			for (int j = i; j < array.length; j++) {
				// 找到最小的数
				if (array[j] < array[minIndex]) {
					// 将最小数的索引保存
					minIndex = j;
				}
			}
			int temp = array[minIndex];
			array[minIndex] = array[i];
			array[i] = temp;
		}
		return array;
	}

	/**
	 * 3，插入排序
	 * 
	 * @param array
	 * @return
	 */
	public static int[] insertionSort(int[] array) {
		if (array.length == 0) {
			return array;
		}
		int current;
		for (int i = 0; i < array.length - 1; i++) {
			current = array[i + 1];
			int preIndex = i;
			while (preIndex >= 0 && current < array[preIndex]) {
				array[preIndex + 1] = array[preIndex];
				preIndex--;
			}
			array[preIndex + 1] = current;
		}
		return array;
	}

	/**
	 * 4，希尔排序
	 *
	 * @param array
	 * @return
	 */
	public static int[] ShellSort(int[] array) {
		int len = array.length;
		int temp, gap = len / 2;
		while (gap > 0) {
			for (int i = gap; i < len; i++) {
				temp = array[i];
				int preIndex = i - gap;
				while (preIndex >= 0 && array[preIndex] > temp) {
					array[preIndex + gap] = array[preIndex];
					preIndex -= gap;
				}
				array[preIndex + gap] = temp;
			}
			gap /= 2;
		}
		return array;
	}

	/**
	 * 5，归并排序
	 *
	 * @param array
	 * @return
	 */
	public static int[] MergeSort(int[] array) {
		if (array.length < 2) {
			return array;
		}
		int mid = array.length / 2;
		int[] left = Arrays.copyOfRange(array, 0, mid);
		int[] right = Arrays.copyOfRange(array, mid, array.length);
		return merge(MergeSort(left), MergeSort(right));
	}

	/**
	 * 归并排序——将两段排序好的数组结合成一个排序数组
	 *
	 * @param left
	 * @param right
	 * @return
	 */
	public static int[] merge(int[] left, int[] right) {
		int[] result = new int[left.length + right.length];
		for (int index = 0, i = 0, j = 0; index < result.length; index++) {
			if (i >= left.length) {
				result[index] = right[j++];
			} else if (j >= right.length) {
				result[index] = left[i++];
			} else if (left[i] > right[j]) {
				result[index] = right[j++];
			} else {
				result[index] = left[i++];
			}
		}
		return result;
	}
}
