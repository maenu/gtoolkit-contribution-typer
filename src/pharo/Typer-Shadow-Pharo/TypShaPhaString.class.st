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
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ SystemDictionary typAsType ]
				ifFalse: [ BlockClosure typAsFunctionTypeWithResult: TypUnknownType new ] ];
		resultType: [ :a :s :r | 
			| node |
			node := a argumentNodes at: 2.
			(node isBlock
				and: [ node body statements size > 0
						and: [ node body statements last isReturn ] ])
				ifTrue: [ Class typAsType ]
				ifFalse: [ {Class typAsType.
					(a argumentTypes at: 1) result} typAsType ] ];
		yourself
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
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | SequenceableCollection typAsType ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {(a argumentTypes at: 1)} ];
		yourself
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
	type
		superType: (type superType copyWithParameters: {Character typAsType}).
	^ type
]
