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
			  ifTrue := node incomingArguments first.
			  ifFalse := node incomingArguments second.
			  next := ifFalse incoming: #next.
			  next origin outgoingRemove: next.
			  next := TypInfNextEdge
				          origin: (ifTrue incomingAt: #next)
				          target: ifFalse.
			  next origin outgoingAdd: next.
			  next := TypInfNextEdge origin: ifTrue incomingReturn target: node.
			  (next origin outgoing at: #next)
				  detect: [ :e | e target == node ]
				  ifFound: [ :e | next origin outgoingRemove: e ].
			  next origin outgoingAdd: next.
			  ifFalse incomingReturn outgoingRemoveAt: #next.
			  (ifFalse outgoing at: #next)
				  detect: [ :e | e target == node ]
				  ifFound: [ :e | ifFalse outgoingRemove: e ].
			  next := TypInfNextEdge
				          origin: ifFalse incomingReturn
				          target: node.
			  next origin outgoingAdd: next ];
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
