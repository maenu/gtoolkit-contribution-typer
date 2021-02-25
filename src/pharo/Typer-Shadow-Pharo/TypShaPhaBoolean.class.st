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
	<typMigrated>
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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1) result asNullable
		arguments: {BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaBoolean >> mIfTrue: aLookup [
	<typShaMethod: 'ifTrue:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1) result asNullable
		arguments: {BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaBoolean >> mIfTrueIfFalse: aLookup [
	<typShaMethod: 'ifTrue:ifFalse:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(aLookup arguments
				collect: [ :e | 
					e isFunction
						ifTrue: [ e result ]
						ifFalse: [ e ] ]) typAsType
		arguments: {BlockClosure typAsType}
]

{ #category : #shadow }
TypShaPhaBoolean >> mNot: aLookup [
	<typShaMethod: 'not'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaBoolean >> mOr: aLookup [
	<typShaMethod: 'or:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments:
			{{Boolean typAsType.
			(BlockClosure typAsFunctionTypeWithResult: Boolean typAsType)}
				typAsType}
]
