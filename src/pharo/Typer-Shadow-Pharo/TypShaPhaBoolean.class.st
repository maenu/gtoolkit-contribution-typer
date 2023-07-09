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
	^ (CompiledMethod
		   typAsFunctionTypeWithResult: (aLookup arguments collect: [ :e | 
					    e isFunction
						    ifTrue: [ e result ]
						    ifFalse: [ e ] ]) typAsType
		   arguments: { 
				   BlockClosure typAsType.
				   BlockClosure typAsType })
		  typInfRotater: [ :node | "move second from sequential to parallel"
			  | ifTrue ifFalse next |
			  ifTrue := node inArguments first.
			  ifFalse := node inArguments second.
			  next := ifFalse in: #next.
			  next origin outRemove: next.
			  next := TypInfNextEdge
				          origin: (ifTrue inAt: #next)
				          target: ifFalse.
			  next origin outAdd: next.
			  next := TypInfNextEdge
				          origin: ((ifTrue isKindOf: TypInfBlock)
						           ifTrue: [ ifTrue inAt: #return ]
						           ifFalse: [ ifTrue ])
				          target: node.
			  next origin out at: #next ifPresent: [ :c | 
					  c
						  detect: [ :e | e target == node ]
						  ifFound: [ :e | next origin outRemove: e ] ].
			  next origin outAdd: next.
			  next := TypInfNextEdge
				          origin: ((ifFalse isKindOf: TypInfBlock)
						           ifTrue: [ ifFalse inAt: #return ]
						           ifFalse: [ ifFalse ])
				          target: node.
			  next origin out at: #next ifPresent: [ :c | 
					  c
						  detect: [ :e | e target == node ]
						  ifFound: [ :e | next origin outRemove: e ] ].
			  next origin outAdd: next ];
		  yourself
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
