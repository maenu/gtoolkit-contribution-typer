Class {
	#name : #TypShaGtGtSourceCoder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtSourceCoder class >> shadowedClass [
	^ GtSourceCoder class
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mClassOrMetaClass: aLookup [
	<typShaMethod: 'classOrMetaClass'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ClassDescription typAsType
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mCollapsedEditor: aLookup [
	<typShaMethod: 'collapsedEditor'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: BrTextEditor typAsType
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mExpanded: aLookup [
	<typShaMethod: 'expanded:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {Boolean typAsType}
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mMethodsCoder: aLookup [ 
	<typShaMethod: 'methodsCoder:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | GtMethodsCoder typAsType ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mSource: aLookup [
	<typShaMethod: 'source'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
