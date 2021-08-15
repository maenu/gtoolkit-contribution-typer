Class {
	#name : #TypShaPhaNumber,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaNumber class >> shadowedClass [
	^ Number class
]

{ #category : #shadow }
TypShaPhaNumber >> mBinary233: aLookup [
	<typShaMethod: '-'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{aLookup root receiver.
			(aLookup arguments at: 1)} typAsType
		arguments: {Number typAsType}
]

{ #category : #shadow }
TypShaPhaNumber >> mBinary235: aLookup [
	<typShaMethod: '+'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{aLookup root receiver.
			(aLookup arguments at: 1)} typAsType
		arguments: {Number typAsType}
]

{ #category : #shadow }
TypShaPhaNumber >> mTimesCollect: aLookup [
	<typShaMethod: 'timesCollect:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(OrderedCollection typAsType
				copyWithParameters:
					{(aLookup arguments
						collect: [ :e | 
							e isFunction
								ifTrue: [ e result ]
								ifFalse: [ e ] ]) typAsType})
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {Integer typAsType}
				argumentsOptional: true
				signalsAlways: false)}
]

{ #category : #shadow }
TypShaPhaNumber >> mTo: aLookup [
	<typShaMethod: 'to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(Interval typAsType
				copyWithParameters:
					{{aLookup root receiver.
					(aLookup arguments at: 1)} typAsType})
		arguments: {Number typAsType}
]

{ #category : #shadow }
TypShaPhaNumber >> mToDo: aLookup [
	<typShaMethod: 'to:do:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{Number typAsType.
			(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments:
					{{aLookup root receiver.
					(aLookup arguments at: 1)} typAsType})}
]
