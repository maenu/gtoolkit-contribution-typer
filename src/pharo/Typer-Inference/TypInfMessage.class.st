Class {
	#name : #TypInfMessage,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#instVars : [
		'lookup',
		'contexts'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMessage >> arguments [
	^ self inArguments
		collect: [ :n | state at: n ifAbsent: TypUnknownType instance ]
]

{ #category : #accessing }
TypInfMessage >> canInstall [
	| newContexts |
	newContexts := self newContexts.
	(newContexts size between: 1 and: 8) ifFalse: [ ^ false ].
	^ newContexts allSatisfy: [ :e | e value canInstall ]
]

{ #category : #accessing }
TypInfMessage >> constrainedReceiver [
	| receiver implementors |
	receiver := self receiver.
	receiver isUnknown
		ifFalse: [ ^ ({#ifNil:.
				#ifNotNil:.
				#ifNil:ifNotNil:.
				#ifNotNil:ifNil:} includes: self selector)
				ifTrue: [ receiver asNullable ]
				ifFalse: [ receiver ] ].
	implementors := TypInfIndex instance implementors: self selector.
	(implementors size between: 1 and: 8) ifFalse: [ ^ receiver ].
	^ (implementors collect: #typAsType) typAsMinimizedType
]

{ #category : #accessing }
TypInfMessage >> findInReceiver [
	self depthFirstNextReverseDo: [ :n | n node == node receiver ifTrue: [ ^ n ] ].
	Error signal: 'no receiver found'
]

{ #category : #accessing }
TypInfMessage >> inReceiver [
	^ self inAt: #receiver ifAbsentPut: [ self findInReceiver ]
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
	oldContexts ifEmpty: [ self outDisable ].
	contexts := self newContexts asOrderedCollection
			collect: [ :c | 
				oldContexts
					detect: [ :cc | cc = c ]
					ifFound: [ :cc | cc ]
					ifNone: [ c ] ].
	self assert: [ contexts isNotEmpty ].
	(oldContexts difference: contexts) collect: #value thenDo: #uninstall.
	(contexts difference: oldContexts) collect: #value thenDo: #install
]

{ #category : #accessing }
TypInfMessage >> lookup [
	^ lookup
]

{ #category : #accessing }
TypInfMessage >> newContexts [
	| lookups |
	lookups := lookup preResolve.
	lookups
		detect: [ :l | l resolver isKindOf: TypInfMethodResolver ]
		ifFound: [ (lookups
				flatCollect: [ :l | 
					| ll |
					ll := l typInfAsLookup: self.
					((l resolver isKindOf: TypInfMethodResolver)
						and: [ TypInfIndex instance contextResolver canResolve: ll ])
						ifTrue: [ TypInfIndex instance contextResolver resolve: ll ]
						ifFalse: [ {} ] ]
				as: Set) ifNotEmpty: [ :s | ^ s ] ].
	lookup resolve signalsAlways
		ifNotNil: [ :t | 
			^ {lookup
					-> (TypInfSignalContext
							sender: context
							state: state copy
							node: node
							self: context self
							super: context super
							message: self
							exception: t)} ].
	^ #()
]

{ #category : #accessing }
TypInfMessage >> outDisable [
	self
		outDisable: #next;
		outDisable: #return;
		outDisable: #signal
]

{ #category : #accessing }
TypInfMessage >> outDisable: aSymbol [
	^ (self outEnableds: aSymbol) collect: #disable
]

{ #category : #accessing }
TypInfMessage >> outDisableds: aSymbol [
	^ out
		at: (aSymbol , #Disabled) asSymbol
		ifPresent: #copy
		ifAbsent: #()
]

{ #category : #accessing }
TypInfMessage >> outEnable: aSymbol origin: aNode [
	(self outDisableds: aSymbol) do: [ :e | e enableOrigin: aNode ]
]

{ #category : #accessing }
TypInfMessage >> outEnableOrigin: aNode [
	self
		outEnable: #next origin: aNode;
		outEnable: #return origin: aNode;
		outEnable: #signal origin: aNode
]

{ #category : #accessing }
TypInfMessage >> outEnableds: aSymbol [
	^ out
		at: aSymbol
		ifPresent: #copy
		ifAbsent: #()
]

{ #category : #accessing }
TypInfMessage >> receiver [
	^ state at: self inReceiver ifAbsent: TypUnknownType instance
]

{ #category : #accessing }
TypInfMessage >> selector [
	^ node selector asSymbol
]

{ #category : #accessing }
TypInfMessage >> transfer [
	| oldLookup |
	self constrain: self inReceiver to: self constrainedReceiver.
	oldLookup := lookup.
	lookup := self inReceiver newMethodLookup: self.	"(lookup isNotNil and: [ oldLookup isNotNil and: [ lookup > oldLookup ] ])
		ifTrue: [ Halt now ]."
	((lookup ~= oldLookup or: [ contexts isNotEmpty ]) and: [ self canInstall ]) ifTrue: [ self install ].
	contexts
		detect: [ :c | c isKindOf: TypInfSignalContext ]
		ifFound: [ :c | 
			lookup resolve signalsAlways
				ifNotNil: [ :t | c root exception: t classDescription new ] ].
	contexts
		ifEmpty: [ | method |
			method := lookup resolve.
			self inArguments
				withIndexDo: [ :e :i | 
					i <= method arguments size
						ifTrue: [ self constrain: e to: (method arguments at: i) ] ].
			state at: self put: method result ]
		ifNotEmpty: [ state
				at: self
				put: (contexts collect: [ :a | a value root inReturnType ]) typAsMinimizedType ].
	state at: self inReceiver put: self receiver asNonNullable
]

{ #category : #accessing }
TypInfMessage >> uninstall [
	self
		inAt: #receiver
		ifPresent: [ :r | self unconstrain: r ]
		ifAbsent: [  "noop" ].	"might be in dirty state during node uninstall"
	contexts
		collect: #value thenDo: #uninstall;
		removeAll.
	lookup := nil.
	self outEnable: #next origin: self.
	super uninstall
]
