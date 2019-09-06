Class {
	#name : #TypMethodResolver,
	#superclass : #TypResolver,
	#instVars : [
		'argumentTypes',
		'resultType',
		'signalsAlways'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolver >> argumentTypeAt: anInteger for: aLookup resolvedBy: anotherLookup [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'TypMethodLookup'>
	<typTypeArgument: 3 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypLookupTypeResult'>
	self flag: 'FIXME no pokemon catching'.
	[ ^ TypLookupTypeResult new
		type:
			(argumentTypes
				cull: anInteger
				cull: aLookup
				cull: anotherLookup
				cull: self);
		lookup: aLookup;
		resolvedBy: anotherLookup;
		resolver: self;
		yourself ]
		on: Error
		do: [ :e | 
			TypNoCompatibleTypeError new
				cause: e;
				signal ]
]

{ #category : #accessing }
TypMethodResolver >> argumentTypes [
	<typTypeResultAs: 'BlockClosure[Integer,TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->TypType'>
	^ argumentTypes
]

{ #category : #accessing }
TypMethodResolver >> argumentTypes: anObject [
	<typTypeArgument: 1 as: 'BlockClosure[Integer,TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->TypType'>
	argumentTypes := anObject
]

{ #category : #initialization }
TypMethodResolver >> initialize [
	<typTypeParametersAs: 'TypMethodLookup'>
	<typTypeVariable: 'argumentTypes' as:
		'BlockClosure[Integer,TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->TypType'>
	<typTypeVariable: 'resultType' as:
		'BlockClosure[TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->TypType'>
	<typTypeVariable: 'signalsAlways' as:
		'BlockClosure[TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->!Boolean'>
	super initialize.
	argumentTypes := [ TypUnknownType instance ].
	resultType := [ TypUnknownType instance ].
	signalsAlways := [ nil ]
]

{ #category : #accessing }
TypMethodResolver >> resultType [
	<typTypeResultAs: 'BlockClosure[TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->TypType'>
	^ resultType
]

{ #category : #accessing }
TypMethodResolver >> resultType: anObject [
	<typTypeArgument: 1 as: 'BlockClosure[TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->TypType'>
	resultType := anObject
]

{ #category : #accessing }
TypMethodResolver >> resultTypeFor: aLookup resolvedBy: anotherLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeArgument: 2 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypLookupTypeResult'>
	self flag: 'FIXME no pokemon catching'.
	[ ^ TypLookupTypeResult new
		type: (resultType cull: aLookup cull: anotherLookup cull: self);
		lookup: aLookup;
		resolvedBy: anotherLookup;
		resolver: self;
		yourself ]
		on: Error
		do: [ :e | 
			TypNoCompatibleTypeError new
				cause: e;
				signal ]
]

{ #category : #accessing }
TypMethodResolver >> signalsAlways [
	<typTypeResultAs: 'BlockClosure[TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->!Boolean'>
	^ signalsAlways
]

{ #category : #accessing }
TypMethodResolver >> signalsAlways: anObject [
	<typTypeArgument: 1 as: 'BlockClosure[TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->!Boolean'>
	signalsAlways := anObject
]

{ #category : #accessing }
TypMethodResolver >> signalsAlwaysFor: aLookup resolvedBy: anotherLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeArgument: 2 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypLookupSignalsAlwaysResult'>
	self flag: 'FIXME no pokemon catching'.
	[ ^ TypLookupSignalsAlwaysResult new
		signalsAlways: (signalsAlways cull: aLookup cull: anotherLookup cull: self);
		lookup: aLookup;
		resolvedBy: anotherLookup;
		resolver: self;
		yourself ]
		on: Error
		do: [ :e | 
			TypNoCompatibleTypeError new
				cause: e;
				signal ]
]
