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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Boolean typAsType}
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mMethodsCoder: aLookup [
	<typShaMethod: 'methodsCoder:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments: {GtMethodsCoder typAsType}
]

{ #category : #shadow }
TypShaGtGtSourceCoder >> mSource: aLookup [
	<typShaMethod: 'source'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
