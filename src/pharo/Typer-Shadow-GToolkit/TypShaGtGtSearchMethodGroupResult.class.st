Class {
	#name : #TypShaGtGtSearchMethodGroupResult,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtSearchMethodGroupResult class >> mForFilter: aLookup [
	<typShaMethod: 'forFilter:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {GtSearchMethodsFilter typAsType}
]

{ #category : #'as yet unclassified' }
TypShaGtGtSearchMethodGroupResult class >> shadowedClass [
	^ GtSearchMethodGroupResult class
]

{ #category : #converting }
TypShaGtGtSearchMethodGroupResult >> resolveType: aLookup [
	^ aLookup root classDescription
		typAsParametricTypeWithParameters: {('@A' -> CompiledMethod typAsType)} asOrderedDictionary
]
