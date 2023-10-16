Class {
	#name : #TypInfMethod,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments',
	#classTraits : 'TypInfTWithArguments classTrait',
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMethod >> arguments [
	^ self inArguments collect: #type
]

{ #category : #accessing }
TypInfMethod >> asFunction [
	^ self type
]

{ #category : #accessing }
TypInfMethod >> lookup [
	^ TypMethodLookup
		receiver: context self
		selector: node selector
		arguments: self arguments
		self: context self
		super: context super
		parent: nil
]

{ #category : #accessing }
TypInfMethod >> methodNode [

	^ self
]

{ #category : #accessing }
TypInfMethod >> transfer [
	| return signal |
	return := self inReturnType.
	signal := self inSignalType.
	state
		at: self
		put: (CompiledMethod
				typAsFunctionTypeWithResult: return
				arguments: (self inArguments collect: #type)
				argumentsOptional: false
				signalsAlways: (return isVoid ifTrue: [ signal ] ifFalse: [ nil ])
				signalsMaybe: (return isVoid ifTrue: [ nil ] ifFalse: [ signal ]))
]
