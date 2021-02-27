Class {
	#name : #TypShaGtGtSearchMethodGroupResult,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #shadow }
TypShaGtGtSearchMethodGroupResult class >> mForFilter: aLookup [
	<typShaMethod: 'forFilter:'>
	<typMigrated>
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
	^ aLookup classDescription
		typAsParametricTypeWithParameters: {('@A' -> CompiledMethod typAsType)} asOrderedDictionary
]
