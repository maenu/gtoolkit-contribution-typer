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
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments:
			{{Boolean typAsType.
			(BlockClosure typAsFunctionTypeWithResult: Boolean typAsType)}
				typAsType}
]

{ #category : #shadow }
TypShaPhaBoolean >> mIfFalse: aLookup [
	<typShaMethod: 'ifFalse:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1) result asNullable
		arguments: {BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaBoolean >> mIfTrue: aLookup [
	<typShaMethod: 'ifTrue:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1) result asNullable
		arguments: {BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaBoolean >> mIfTrueIfFalse: aLookup [
	<typShaMethod: 'ifTrue:ifFalse:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments
				collect: [ :e | e isFunction ifTrue: [ e result ] ifFalse: [ e ] ])
				typAsType
		arguments: {BlockClosure typAsType.
				BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaBoolean >> mNot: aLookup [
	<typShaMethod: 'not'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaBoolean >> mOr: aLookup [
	<typShaMethod: 'or:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments:
			{{Boolean typAsType.
			(BlockClosure typAsFunctionTypeWithResult: Boolean typAsType)}
				typAsType}
]
