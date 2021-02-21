Class {
	#name : #TypShaPhaString,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaString class >> shadowedClass [
	^ String class
]

{ #category : #converting }
TypShaPhaString >> asType: aClass [
	^ aClass == String
		ifTrue: [ | type |
			type := aClass typAsNamedType.
			type
				superType:
					(type superType copyWithParameters: {Character typAsType}).
			^ type ]
		ifFalse: [ aClass typAsNamedType ]
]

{ #category : #shadow }
TypShaPhaString >> mAsClass: aLookup [ 
	<typShaMethod: 'asClass'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Class typAsType ];
		yourself
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
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RPackage typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaString >> mIncludesSubstring: aLookup [ 
	<typShaMethod: 'includesSubstring:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaString >> mJoin: aLookup [ 
	<typShaMethod: 'join:'>
	
	^ TypFunctionType new
		argumentTypes:
				[ :i :a :s :r | Collection typAsType copyWithParameters: {String typAsType} ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaString >> mKeywords: aLookup [ 
	<typShaMethod: 'keywords'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {String typAsType} ];
		yourself
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
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]
