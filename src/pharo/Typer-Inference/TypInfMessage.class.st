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
TypInfMessage >> couldBeSelfOrSuperSend [
	^ {context self.
		context super} includes: self receiver
]

{ #category : #accessing }
TypInfMessage >> findInReceiver [
	self depthFirstNextReverseDo: [ :n | n node == node receiver ifTrue: [ ^ n ] ].
	Error signal: 'no receiver found'
]

{ #category : #accessing }
TypInfMessage >> hasNodes [
	^ {self receiver} , self arguments anySatisfy: #hasNode
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
	| oldContexts oldContextValues contextValues |
	oldContexts := contexts.
	oldContexts ifEmpty: [ self outDisable ].
	contexts := self newContexts.
	contexts := contexts asSet
			collect: [ :a | 
				oldContexts
					detect: [ :aa | aa value = a value ]
					ifFound: [ :aa | a key -> aa value ]
					ifNone: [ a ] ].
	self assert: [ contexts isNotEmpty ].
	oldContextValues := oldContexts collect: #value.
	contextValues := contexts collect: #value.
	(oldContextValues difference: contextValues) do: #uninstall.
	(contextValues difference: oldContextValues) do: #install
]

{ #category : #accessing }
TypInfMessage >> lookup [
	^ lookup
]

{ #category : #accessing }
TypInfMessage >> newContexts [
	self recursiveContextOrNil
		ifNotNil: [ :c | 
			^ {lookup
					-> (TypInfRecursionContext
							sender: context
							state: state copy
							node: node
							self: context self
							super: context super
							message: self)} ].
	^ lookup preResolve
		flatCollect: [ :l | 
			(TypInfIndex instance canResolve: l)
				ifTrue: [ TypInfIndex instance resolve: l ]
				ifFalse: [ {l
							-> (TypInfInlLookupContext
									sender: context
									state: state copy
									node: node copy
									self: context self
									super: context super
									message: self
									lookup: l)} ] ]
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
TypInfMessage >> recursiveContextOrNil [
	^ (context stack copyWithout: context) reversed
		detect: [ :c | 
			c node isMethod
				and: [ (c isKindOf: TypInfInlContext) and: [ c root lookup = lookup asDefault ] ] ]
		ifFound: #yourself
		ifNone: nil
]

{ #category : #accessing }
TypInfMessage >> selector [
	^ node selector asSymbol
]

{ #category : #accessing }
TypInfMessage >> signalsAlways [
	| signalsAlways |
	contexts
		ifEmpty: [ lookup ifNil: [ ^ nil ].
			^ lookup asDefault resolve signalsAlways ].
	signalsAlways := contexts collect: [ :a | a value root type signalsAlways ].
	(signalsAlways includes: nil) ifTrue: [ ^ nil ].
	^ signalsAlways typAsMinimizedType
]

{ #category : #accessing }
TypInfMessage >> signalsMaybe [
	contexts
		ifEmpty: [ lookup ifNil: [ ^ nil ].
			^ lookup asDefault resolve signalsMaybe ].
	^ (contexts collect: [ :a | a value root type signalsMaybe ] thenReject: #isNil)
		ifEmpty: nil
		ifNotEmpty: #typAsType
]

{ #category : #accessing }
TypInfMessage >> transfer [
	| oldLookup |
	self constrain: self inReceiver to: self constrainedReceiver.
	oldLookup := lookup.
	lookup := self inReceiver newMethodLookup: self.
	(lookup ~= oldLookup and: [ self canInstall ]) ifTrue: [ self install ].
	state
		at: self
		put: (contexts
				ifEmpty: [ TypUnknownType instance ]
				ifNotEmpty: [ (contexts collect: [ :a | a value root inReturnType ]) typAsMinimizedType ])
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
	self outEnableOrigin: self.
	super uninstall
]
