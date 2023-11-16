Class {
	#name : #TypInfMessage,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#instVars : [
		'contexts',
		'newContexts'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMessage >> arguments [
	^ self inArguments
		collect: [ :n | state at: n ifAbsent: [ TypUnknownType instance ] ]
]

{ #category : #accessing }
TypInfMessage >> asFunction [
	^ CompiledMethod
		typAsFunctionTypeWithResult: (self signalsAlways
				ifNil: [ self type ]
				ifNotNil: [ TypVoidType instance ])
		arguments: self arguments
		argumentsOptional: false
		signalsAlways: self signalsAlways
		signalsMaybe: self signalsMaybe
]

{ #category : #accessing }
TypInfMessage >> canInstall [
	newContexts := self newContexts.
	(newContexts size
		between: 1
		and: TypInfCurrentConfiguration value maxInlinesPerSend) ifFalse: [ ^ false ].
	^ newContexts allSatisfy: #canInstall
]

{ #category : #accessing }
TypInfMessage >> constrainReceiver [
	| receiver implementors |
	receiver := self receiver.
	({#ifNil:.
		#ifNotNil:.
		#ifNil:ifNotNil:.
		#ifNotNil:ifNil:} includes: self selector)
		ifTrue: [ state at: self inReceiver put: receiver asNullable.
			^ self ].
	receiver isUnknown ifFalse: [ ^ self ].
	implementors := TypInfIndex instance implementors: self selector.
	(implementors size between: 1 and: 8)
		ifTrue: [ self
				constrain: self inReceiver
				to: (implementors collect: #typAsType) typAsMinimizedType ]
]

{ #category : #accessing }
TypInfMessage >> couldBeSelfOrSuperSend [
	^ {context self.
		context super} includes: self receiver
]

{ #category : #accessing }
TypInfMessage >> hasNodes [
	^ {self receiver} , self arguments anySatisfy: #hasNode
]

{ #category : #accessing }
TypInfMessage >> inReceiver [
	^ self inAt: #receiver
]

{ #category : #accessing }
TypInfMessage >> inReceiver: aNode [
	^ self inAt: #receiver put: aNode
]

{ #category : #accessing }
TypInfMessage >> initialize [
	super initialize.
	contexts := Set new
]

{ #category : #accessing }
TypInfMessage >> install [
	| oldContexts |
	oldContexts := contexts.
	oldContexts ifEmpty: [ self outNextDisable ].
	contexts := newContexts asSet
			collect: [ :c | 
				oldContexts
					detect: [ :cc | cc canAbsorb: c ]
					ifFound: [ :cc | cc absorb: c ]
					ifNone: [ c ] ].
	self assert: [ contexts isNotEmpty ].
	oldContexts rehash.	"due to #absorb:"
	(oldContexts difference: contexts) do: #uninstall.
	(contexts difference: oldContexts) do: #install.
	self assert: [ contexts allSatisfy: #isInstalled ]
]

{ #category : #accessing }
TypInfMessage >> lookups [
	^ self inReceiver newMethodLookups: self
]

{ #category : #accessing }
TypInfMessage >> newContexts [
	self recursiveContextOrNil
		ifNotNil: [ :c | 
			^ {TypInfRecursionContext
					sender: context
					state: state
					node: node
					lookup: c lookup
					message: self} ].
	^ self lookups
		flatCollect: [ :l | 
			(TypInfIndex instance absCanResolve: l message: self)
				ifTrue: [ {TypInfIndex instance absResolve: l message: self} ]
				ifFalse: [ (TypInfIndex instance inlCanResolve: l message: self)
						ifTrue: [ TypInfIndex instance inlResolve: l message: self ]
						ifFalse: [ {TypInfInlLookupContext
									sender: context
									state: state
									node: node
									lookup: l
									message: self} ] ] ]
]

{ #category : #accessing }
TypInfMessage >> outNextDisable [
	^ out
		at: #next
		ifPresent: [ :s | s collect: #disable ]
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypInfMessage >> outNextDisableds [
	^ out at: #nextDisabled ifAbsent: #()
]

{ #category : #accessing }
TypInfMessage >> outNextDisabledsEnableOn: aNode [
	self outNextDisableds do: [ :e | e enableOrigin: aNode ]
]

{ #category : #accessing }
TypInfMessage >> receiver [
	^ state at: self inReceiver ifAbsent: [ TypUnknownType instance ]
]

{ #category : #accessing }
TypInfMessage >> recursiveContextOrNil [
	^ (context stack copyWithout: context) reversed
		detect: [ :c | 
			c node isMethod
				and: [ (c isKindOf: TypInfInlContext) and: [ self lookups includes: c root lookup ] ] ]
		ifNone: nil
]

{ #category : #accessing }
TypInfMessage >> selector [
	^ node selector asSymbol
]

{ #category : #accessing }
TypInfMessage >> signalsAlways [
	| signalsAlways |
	signalsAlways := contexts collect: [ :c | c root type signalsAlways ].
	signalsAlways ifEmpty: [ ^ nil ].
	(signalsAlways includes: nil) ifTrue: [ ^ nil ].
	^ signalsAlways typAsMinimizedType
]

{ #category : #accessing }
TypInfMessage >> signalsMaybe [
	| signalsMaybe |
	signalsMaybe := (contexts collect: [ :c | c root type signalsMaybe ])
			reject: #isNil.
	signalsMaybe ifEmpty: [ ^ nil ].
	^ signalsMaybe typAsType
]

{ #category : #accessing }
TypInfMessage >> transfer [
	self constrainReceiver.
	self canInstall ifTrue: [ self install ].
	self
		put: (contexts
				ifEmpty: [ TypUnknownType instance ]
				ifNotEmpty: [ (contexts collect: [ :c | c root inReturnType ]) typAsMinimizedType ])
]

{ #category : #accessing }
TypInfMessage >> uninstall [
	self
		inAt: #receiver
		ifPresent: [ :r | self unconstrain: r ]
		ifAbsent: [  "noop" ].	"might be in dirty state during node uninstall"
	contexts do: #uninstall.
	contexts removeAll.
	self outNextDisabledsEnableOn: self.
	super uninstall
]
