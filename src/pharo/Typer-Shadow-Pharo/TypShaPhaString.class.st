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
	^ CompiledMethod
		typAsFunctionTypeWithResult: Class typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaString >> mAsClassInEnvironmentIfAbsent: aLookup [ 
	<typShaMethod: 'asClassInEnvironment:ifAbsent:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ SystemDictionary typAsType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments: {}
						argumentsOptional: false
						signalsAlways: false ] ];
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
	^ CompiledMethod
		typAsFunctionTypeWithResult: RPackage typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaString >> mIncludesSubstring: aLookup [
	<typShaMethod: 'includesSubstring:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaString >> mJoin: aLookup [
	<typShaMethod: 'join:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: String typAsType
		arguments: {(Collection typAsType copyWithParameters: {String typAsType})}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaString >> mKeywords: aLookup [
	<typShaMethod: 'keywords'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {String typAsType})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
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
	^ CompiledMethod
		typAsFunctionTypeWithResult: String typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #converting }
TypShaPhaString >> resolveType: aLookup [
	| type |
	type := aLookup classDescription typAsNamedType.
	type
		superType: (type superType copyWithParameters: {Character typAsType}).
	^ type
]
