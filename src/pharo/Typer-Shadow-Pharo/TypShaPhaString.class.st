Class {
	#name : #TypShaPhaString,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaString class >> shadowedClass [
	^ String class
]

{ #category : #shadow }
TypShaPhaString >> mAsClass: aLookup [
	<typShaMethod: 'asClass'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Class typAsType
]

{ #category : #shadow }
TypShaPhaString >> mAsClassInEnvironmentIfAbsent: aLookup [
	<typShaMethod: 'asClassInEnvironment:ifAbsent:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{Class typAsType.
			(aLookup arguments at: 1) result} typAsType
		arguments:
			{SystemDictionary typAsType.
			BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaString >> mAsPackage: aLookup [
	<typShaMethod: 'asPackage'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: RPackage typAsType
]

{ #category : #shadow }
TypShaPhaString >> mIncludesSubstring: aLookup [
	<typShaMethod: 'includesSubstring:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaString >> mJoin: aLookup [
	<typShaMethod: 'join:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: String typAsType
		arguments: {(Collection typAsType copyWithParameters: {String typAsType})}
]

{ #category : #shadow }
TypShaPhaString >> mKeywords: aLookup [
	<typShaMethod: 'keywords'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {String typAsType})
]

{ #category : #shadow }
TypShaPhaString >> mSplit: aLookup [
	<typShaMethod: 'split:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {(aLookup arguments at: 1)})
		arguments: {SequenceableCollection typAsType}
]

{ #category : #shadow }
TypShaPhaString >> mTranslated: aLookup [
	<typShaMethod: 'translated'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #converting }
TypShaPhaString >> resolveType: aLookup [
	| type |
	type := aLookup classDescription typAsNamedType.
	(type hasSuperType and: [ type superType isParametric ])
		ifTrue: [ type
				superType: (type superType copyWithParameters: {Character typAsType}) ].
	^ type
]
