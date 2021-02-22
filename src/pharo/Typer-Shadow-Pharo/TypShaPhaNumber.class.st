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
	self flag: 'FIXME argumentTypes'.
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{aLookup receiverType.
			(aLookup argumentTypes at: 1)} typAsType
		arguments: {Number typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaNumber >> mBinary235: aLookup [
	<typShaMethod: '+'>
	self flag: 'FIXME argumentTypes'.
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			{aLookup receiverType.
			(aLookup argumentTypes at: 1)} typAsType
		arguments: {Number typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaNumber >> mTimesCollect: aLookup [ 
	<typShaMethod: 'timesCollect:'>
	
	^ TypFunctionType new
		argumentTypes: [ BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {Integer typAsType}
				argumentsOptional: true
				signalsAlways: false ];
		resultType: [ :a | 
			OrderedCollection typAsType
				copyWithParameters:
					{(a argumentTypes
						collect: [ :e | 
							e isFunction
								ifTrue: [ e result ]
								ifFalse: [ TypUnknownType new ] ]) typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaNumber >> mTo: aLookup [ 
	<typShaMethod: 'to:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Number typAsType ];
		resultType: [ :a :s :r | 
			Interval typAsType
				copyWithParameters:
					{{a receiverType.
					(a argumentTypes at: 1)} typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaNumber >> mToDo: aLookup [ 
	<typShaMethod: 'to:do:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Number typAsType ]
				ifFalse: [ BlockClosure
						typAsFunctionTypeWithResult: TypUnknownType new
						arguments:
							{{a receiverType.
							(a argumentTypes at: 1)} typAsType}
						argumentsOptional: false
						signalsAlways: false ] ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
