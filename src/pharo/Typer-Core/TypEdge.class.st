Class {
	#name : #TypEdge,
	#superclass : #Object,
	#instVars : [
		'dependency',
		'dependent',
		'label',
		'data'
	],
	#category : 'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypEdge class >> dependency: aType dependent: anotherType label: aString data: anObject [

	^ self new
		  initializeDependency: aType
		  dependent: anotherType
		  label: aString
		  data: anObject;
		  yourself
]

{ #category : #accessing }
TypEdge >> asElementIn: aMondrian [

	| color border |
	color := Color gray alpha: 0.5.
	border := BlBorder builder
		          paint: color;
		          width: 2;
		          build.
	^ BlParabollaArcElement new
		  when: BlClickEvent do: [ :f | 
			  f consumed: true.
			  f target phlow spawnObject: self ];
		  layout: BlFrameLayout new;
		  addChild: (BrLabel new
				   constraintsDo: [ :c | 
					   c frame horizontal alignCenter.
					   c frame vertical alignCenter ];
				   beSmallSize;
				   aptitude: BrGlamorousLabelAptitude;
				   text: label asRopedText;
				   yourself);
		  zIndex: -1;
		  clipChildren: false;
		  curvatureFraction: 0.1;
		  border: border;
		  toHead: (BlArrowheadTriangle new
				   scale: 2;
				   border: border;
				   background: color;
				   yourself);
		  yourself
]

{ #category : #accessing }
TypEdge >> data [

	^ data
]

{ #category : #accessing }
TypEdge >> dependency [

	^ dependency
]

{ #category : #accessing }
TypEdge >> dependent [

	^ dependent
]

{ #category : #initialization }
TypEdge >> initializeDependency: aType dependent: anotherType label: aString data: anObject [

	dependency := aType.
	dependent := anotherType.
	label := aString.
	data := anObject
]

{ #category : #accessing }
TypEdge >> label [

	^ label
]
