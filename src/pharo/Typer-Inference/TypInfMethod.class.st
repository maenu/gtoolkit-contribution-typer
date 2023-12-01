Class {
	#name : #TypInfMethod,
	#superclass : #TypInfNode,
	#traits : 'TypInfTWithArguments + TypInfTFunction',
	#classTraits : 'TypInfTWithArguments classTrait + TypInfTFunction classTrait',
	#instVars : [
		'lookup'
	],
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
	^ lookup
		ifNil: [ lookup := TypMethodLookup
					receiver: context self
					selector: node selector
					arguments: self arguments
					self: context self
					super: context super.
			((lookup resolver isKindOf: TypInfMethodResolver)
				and: [ lookup context isNil ]) ifTrue: [ lookup context: context ].
			lookup ]
]

{ #category : #accessing }
TypInfMethod >> transfer [
	| return signal |
	lookup := nil.
	return := self inReturnType.
	signal := self inSignalType.
	self
		put: (CompiledMethod
				typAsFunctionTypeWithResult: return
				arguments: (self inArguments collect: #type)
				argumentsOptional: false
				signalsAlways: (return isVoid ifTrue: [ signal ] ifFalse: [ nil ])
				signalsMaybe: (return isVoid ifTrue: [ nil ] ifFalse: [ signal ]))
]
