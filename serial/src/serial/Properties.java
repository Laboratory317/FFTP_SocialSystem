
package serial;


abstract class Properties{
    private long id;
    private String name;
    // color
    private int attack_damage;
    private int life;
    private int shield;
    private int capacity;
    
    public void setID( long id ){
        this.id = id;
    }
    public void setName( String name ){
        this.name = name;
    }
    public void setAttack_damage( int attack_damage ){
        this.attack_damage = attack_damage;
    }
    public void setLife( int life ){
        this.life = life;
    }
    public void setShield( int shield ){
        this.shield = shield;
    }
    public void setCapacity( int capacity ){
        this.capacity = capacity;
    }

    public long getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public int getAttack_damage() {
        return attack_damage;
    }
    public int getLife() {
        return life;
    }
    public int getShield() {
        return shield;
    }
    public int getCapacity() {
        return capacity;
    }

    abstract void run();
}
