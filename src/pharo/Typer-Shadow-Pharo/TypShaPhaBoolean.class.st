Class {
	#name : #TypShaPhaBoolean,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaBoolean class >> shadowedClass [
	^ Boolean class
]

{ #category : #shadow }
TypShaPhaBoolean >> mAnd: aLookup [ 
	<typShaMethod: 'and:'>
	
	^ TypFunctionType new
		argumentTypes: [ {Boolean typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {}
				argumentsOptional: false
				signalsAlways: false)} typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBoolean >> mIfFalse: aLookup [ 
	<typShaMethod: 'ifFalse:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | (a argumentTypes at: 1) result asNullable ];
		yourself
]

{ #category : #shadow }
TypShaPhaBoolean >> mIfTrue: aLookup [ 
	<typShaMethod: 'ifTrue:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a :s :r | (a argumentTypes at: 1) result asNullable ];
		yourself
]

{ #category : #shadow }
TypShaPhaBoolean >> mIfTrueIfFalse: aLookup [ 
	<typShaMethod: 'ifTrue:ifFalse:'>
	
	^ TypFunctionType new
		argumentTypes: [ BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {}
				argumentsOptional: false
				signalsAlways: false ];
		resultType: [ :a | 
			(a argumentTypes
				collect: [ :e | 
					e isFunction
						ifTrue: [ e result ]
						ifFalse: [ TypUnknownType new ] ]) typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBoolean >> mNot: aLookup [ 
	<typShaMethod: 'not'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaBoolean >> mOr: aLookup [ 
	<typShaMethod: 'or:'>
	
	^ TypFunctionType new
		argumentTypes: [ {Boolean typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: Boolean typAsType
				arguments: {}
				argumentsOptional: false
				signalsAlways: false)} typAsType ];
		resultType: [ Boolean typAsType ];
		yourself
]
